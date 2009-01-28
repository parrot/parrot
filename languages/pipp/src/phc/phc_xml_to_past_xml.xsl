<?xml version='1.0'?>
<xsl:stylesheet
  xmlns:AST="http://www.phpcompiler.org/phc-1.1"
  xmlns:past="http://www.parrotcode.org/PAST-0.1"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0" >

<!--

TODO: AST:source_rep

-->
<!--

$Id$

This transformation takes a XML abstract syntax tree as generated
by PHC from PHP source code. It generates an XML representation of a PAST data structure.

-->
<xsl:output method='xml' indent='yes' />

<xsl:template match="/">
  <xsl:apply-templates select="AST:PHP_script" />
</xsl:template>

<xsl:template match="AST:PHP_script" >
  <xsl:apply-templates select="AST:PHP_class_def_list" />
</xsl:template>

<xsl:template match="AST:PHP_class_def_list" >
  <xsl:apply-templates select="AST:PHP_class_def" />
</xsl:template>

<xsl:template match="AST:PHP_class_def" >
</xsl:template>
<xsl:template match="AST:PHP_class_def[AST:CLASS_NAME[AST:value='%MAIN%']]">
  <xsl:apply-templates select="AST:PHP_member_list" />
</xsl:template>

<xsl:template match="AST:PHP_member_list" >
  <xsl:apply-templates select="AST:PHP_method" />
</xsl:template>

<xsl:template match="AST:PHP_method" >
</xsl:template>
<xsl:template match="AST:PHP_method[AST:PHP_signature[AST:METHOD_NAME[AST:value='%run%']]]">
  <xsl:apply-templates select="AST:PHP_statement_list" />
</xsl:template>

<xsl:template match="AST:PHP_statement_list" >
  <past:Stmts>
    <xsl:apply-templates select="AST:PHP_eval_expr" />
    <xsl:apply-templates select="AST:PHP_if" />
  </past:Stmts>
</xsl:template>

<xsl:template match="AST:PHP_eval_expr" >
  <xsl:apply-templates select="AST:PHP_method_invocation" />
  <xsl:apply-templates select="AST:PHP_assignment" />
</xsl:template>

<xsl:template match="AST:PHP_method_invocation" >
  <past:Op>
    <xsl:attribute name="name" ><xsl:value-of select="AST:METHOD_NAME/AST:value" /></xsl:attribute>
    <xsl:apply-templates select="AST:PHP_actual_parameter_list" />
  </past:Op>
</xsl:template>

<xsl:template match="AST:PHP_actual_parameter_list" >
  <xsl:apply-templates select="AST:PHP_actual_parameter" />
</xsl:template>

<xsl:template match="AST:PHP_actual_parameter" >
  <xsl:apply-templates select="  AST:PHP_method_invocation
                               | AST:STRING
                               | AST:INT
                               | AST:BOOL
                               | AST:NULL
                               | AST:REAL
                               | AST:PHP_bin_op
                               | AST:PHP_unary_op
                               | AST:PHP_variable 
                               | AST:PHP_constant" />
</xsl:template>

<xsl:template match="AST:PHP_bin_op" >
  <past:Op>

    <xsl:attribute name="pirop" >
      <xsl:choose>
        <xsl:when test="AST:OP/AST:value = '+'" >n_add</xsl:when>
        <xsl:when test="AST:OP/AST:value = '-'" >n_sub</xsl:when>
        <xsl:when test="AST:OP/AST:value = '*'" >n_mul</xsl:when>
        <xsl:when test="AST:OP/AST:value = '/'" >n_div</xsl:when>
        <xsl:when test="AST:OP/AST:value = '%'" >n_mod</xsl:when>
      </xsl:choose>
    </xsl:attribute>

    <xsl:attribute name="name" >
      <xsl:choose>
        <xsl:when test="AST:OP/AST:value/@encoding = 'base64'" >
          <xsl:choose>
            <xsl:when test="AST:OP/AST:value = 'PA=='" >infix:&lt;</xsl:when>
            <xsl:when test="AST:OP/AST:value = 'PD0='" >infix:&lt;=</xsl:when>
            <xsl:when test="AST:OP/AST:value = 'Pj0='" >infix:&gt;=</xsl:when>
            <xsl:when test="AST:OP/AST:value = 'Pg=='" >infix:&gt;</xsl:when>
            <xsl:when test="AST:OP/AST:value = 'Jg=='" >infix:&amp;</xsl:when>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="AST:OP/AST:value = '&amp;&amp;'" >infix:AND</xsl:when>
        <xsl:when test="AST:OP/AST:value = '||'" >infix:OR</xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="concat('infix:', AST:OP/AST:value)" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>

    <xsl:apply-templates select="  AST:STRING
                                 | AST:INT
                                 | AST:REAL
                                 | AST:PHP_bin_op
                                 | AST:PHP_unary_op
                                 | AST:PHP_variable
                                 | AST:PHP_constant" />

  </past:Op>
</xsl:template>

<xsl:template match="AST:PHP_unary_op" >
  <past:Op >
    <xsl:attribute name="name" >
      <xsl:value-of select="concat('prefix:', AST:OP/AST:value)" />
    </xsl:attribute>
    <xsl:apply-templates select="  AST:INT
                                 | AST:REAL
                                 | AST:PHP_bin_op
                                 | AST:PHP_unary_op" />
  </past:Op>
</xsl:template>

<!-- value assignment -->
<xsl:template match="AST:PHP_assignment[string(AST:BOOL) = 'false']" >
  <past:Op name='infix:=' pasttype='bind' >
    <xsl:apply-templates select="AST:PHP_variable" />
    <xsl:apply-templates select="  AST:STRING
                                 | AST:INT
                                 | AST:PHP_bin_op
                                 | AST:PHP_constant" />
  </past:Op>
</xsl:template>

<!-- aliasing -->
<xsl:template match="AST:PHP_assignment[string(AST:BOOL) = 'true']" >
  <past:Op name='infix::=' pasttype='bind' >
    <xsl:apply-templates select="AST:PHP_variable" />
    <xsl:apply-templates select="  AST:STRING
                                 | AST:INT
                                 | AST:PHP_bin_op
                                 | AST:PHP_constant" />
  </past:Op>
</xsl:template>

<xsl:template match="AST:PHP_variable" >
  <past:Var scope="package" >
    <xsl:attribute name="name" >
      <xsl:value-of select="concat( '$', AST:VARIABLE_NAME/AST:value )" />
    </xsl:attribute>
  </past:Var>
</xsl:template>

<xsl:template match="AST:PHP_variable[ AST:PHP_expr_list/AST:STRING | AST:PHP_expr_list/AST:INT ]" >
  <past:Var scope="keyed" viviself="Undef" lvalue="1" >
    <xsl:choose>
      <xsl:when test="AST:VARIABLE_NAME/AST:value = '_GET' or AST:VARIABLE_NAME/AST:value = '_POST'" >
        <past:Var scope="package" >
          <xsl:attribute name="name" ><xsl:value-of select="concat( '$', AST:VARIABLE_NAME/AST:value )" /></xsl:attribute>
        </past:Var>
      </xsl:when>
      <xsl:otherwise>
        <past:Var viviself="PhpArray" scope="package" lvalue="1" >
          <xsl:attribute name="name" ><xsl:value-of select="concat( '$', AST:VARIABLE_NAME/AST:value )" /></xsl:attribute>
        </past:Var>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates select="  AST:PHP_expr_list/AST:STRING
                                 | AST:PHP_expr_list/AST:INT" />
  </past:Var>
</xsl:template>

<xsl:template match="AST:PHP_constant" >
  <past:Op name="constant" >
    <past:Val returns="PhpString" >
      <xsl:attribute name="value" ><xsl:value-of select="AST:CONSTANT_NAME/AST:value" /></xsl:attribute>
    </past:Val>
  </past:Op>
</xsl:template>

<xsl:template match="AST:STRING" >
  <past:Val returns="PhpString" >
    <xsl:attribute name="encoding" ><xsl:value-of select="AST:value/@encoding" /></xsl:attribute>
    <xsl:attribute name="value" ><xsl:value-of select="AST:value" /></xsl:attribute>
  </past:Val>
</xsl:template>

<xsl:template match="AST:INT" >
  <past:Val returns="PhpInteger" >
    <xsl:attribute name="value" ><xsl:value-of select="AST:value" /></xsl:attribute>
  </past:Val>
</xsl:template>

<xsl:template match="AST:BOOL" >
  <past:Val returns="PhpBoolean" >
    <xsl:attribute name="value" ><xsl:choose>
      <xsl:when test="AST:value = 'True'"  >1</xsl:when>
      <xsl:when test="AST:value = 'False'" >0</xsl:when>
    </xsl:choose></xsl:attribute>
  </past:Val>
</xsl:template>

<xsl:template match="AST:BOOL" >
  <past:Val returns="PhpNull" >
    <xsl:attribute name="value" >0</xsl:attribute>
  </past:Val>
</xsl:template>

<!-- looks like phc is running into a floating point issue -->
<xsl:template match="AST:REAL" >
  <past:Val returns='PhpFloat' >
    <xsl:attribute name="value" ><xsl:value-of select="AST:source_rep" /></xsl:attribute>
  </past:Val>
</xsl:template>

<xsl:template match="  AST:value
                     | AST:source_rep" >
  <xsl:value-of select="." />
</xsl:template>

<xsl:template match="AST:PHP_if" >
  <past:Op pasttype="if" >
    <xsl:apply-templates select="  AST:STRING
                                 | AST:INT
                                 | AST:REAL
                                 | AST:PHP_bin_op
                                 | AST:PHP_unary_op
                                 | AST:PHP_variable
                                 | AST:PHP_constant" />
    <past:Block blocktype="immediate" >
      <xsl:apply-templates select="AST:PHP_statement_list[1]" />
    </past:Block>
    <past:Block blocktype="immediate" >
      <xsl:apply-templates select="AST:PHP_statement_list[2]" />
    </past:Block>
  </past:Op>
</xsl:template>

</xsl:stylesheet>
