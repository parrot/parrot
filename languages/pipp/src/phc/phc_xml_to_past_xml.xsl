<?xml version='1.0'?>
<xsl:stylesheet
  xmlns:phc="http://www.phpcompiler.org/phc-1.0"
  xmlns:past="http://www.parrotcode.org/PAST-0.1"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0" >
<!--

$Id$

This transformation takes a XML abstract syntax tree as generated
by PHC from PHP source code. It generates an XML representation of a PAST data structure.

-->
<xsl:output method='xml' indent='yes' />

<xsl:template match="/">
  <xsl:apply-templates select="phc:AST_php_script" />
</xsl:template>

<xsl:template match="phc:AST_php_script" >
  <xsl:apply-templates select="phc:AST_class_def_list" />
</xsl:template>

<xsl:template match="phc:AST_class_def_list" >
  <xsl:apply-templates select="phc:AST_class_def" />
</xsl:template>

<xsl:template match="phc:AST_class_def" >
</xsl:template>
<xsl:template match="phc:AST_class_def[phc:Token_class_name[phc:value='%MAIN%']]">
  <xsl:apply-templates select="phc:AST_member_list" />
</xsl:template>

<xsl:template match="phc:AST_member_list" >
  <xsl:apply-templates select="phc:AST_method" />
</xsl:template>

<xsl:template match="phc:AST_method" >
</xsl:template>
<xsl:template match="phc:AST_method[phc:AST_signature[phc:Token_method_name[phc:value='%run%']]]">
  <xsl:apply-templates select="phc:AST_statement_list" />
</xsl:template>

<xsl:template match="phc:AST_statement_list" >
  <past:Stmts>
    <xsl:apply-templates select="phc:AST_eval_expr" />
    <xsl:apply-templates select="phc:AST_if" />
  </past:Stmts>
</xsl:template>

<xsl:template match="phc:AST_eval_expr" >
  <xsl:apply-templates select="phc:AST_method_invocation" />
  <xsl:apply-templates select="phc:AST_assignment" />
</xsl:template>

<xsl:template match="phc:AST_method_invocation" >
  <past:Op>
    <xsl:attribute name="name" ><xsl:value-of select="phc:Token_method_name/phc:value" /></xsl:attribute>
    <xsl:apply-templates select="phc:AST_actual_parameter_list" />
  </past:Op>
</xsl:template>

<xsl:template match="phc:AST_actual_parameter_list" >
  <xsl:apply-templates select="phc:AST_actual_parameter" />
</xsl:template>

<xsl:template match="phc:AST_actual_parameter" >
  <xsl:apply-templates select="  phc:AST_method_invocation
                               | phc:Token_string
                               | phc:Token_int
                               | phc:Token_bool
                               | phc:Token_null
                               | phc:Token_real
                               | phc:AST_bin_op
                               | phc:AST_unary_op
                               | phc:AST_variable 
                               | phc:AST_constant" />
</xsl:template>

<xsl:template match="phc:AST_bin_op" >
  <past:Op>

    <xsl:attribute name="pirop" >
      <xsl:choose>
        <xsl:when test="phc:Token_op/phc:value = '+'" >n_add</xsl:when>
        <xsl:when test="phc:Token_op/phc:value = '-'" >n_sub</xsl:when>
        <xsl:when test="phc:Token_op/phc:value = '*'" >n_mul</xsl:when>
        <xsl:when test="phc:Token_op/phc:value = '/'" >n_div</xsl:when>
        <xsl:when test="phc:Token_op/phc:value = '%'" >n_mod</xsl:when>
      </xsl:choose>
    </xsl:attribute>

    <xsl:attribute name="name" >
      <xsl:choose>
        <xsl:when test="phc:Token_op/phc:value/@encoding = 'base64'" >
          <xsl:choose>
            <xsl:when test="phc:Token_op/phc:value = 'PA=='" >infix:&lt;</xsl:when>
            <xsl:when test="phc:Token_op/phc:value = 'PD0='" >infix:&lt;=</xsl:when>
            <xsl:when test="phc:Token_op/phc:value = 'Pj0='" >infix:&gt;=</xsl:when>
            <xsl:when test="phc:Token_op/phc:value = 'Pg=='" >infix:&gt;</xsl:when>
            <xsl:when test="phc:Token_op/phc:value = 'Jg=='" >infix:&amp;</xsl:when>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="phc:Token_op/phc:value = '&amp;&amp;'" >infix:AND</xsl:when>
        <xsl:when test="phc:Token_op/phc:value = '||'" >infix:OR</xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="concat('infix:', phc:Token_op/phc:value)" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>

    <xsl:apply-templates select="  phc:Token_string
                                 | phc:Token_int
                                 | phc:Token_real
                                 | phc:AST_bin_op
                                 | phc:AST_unary_op
                                 | phc:AST_variable
                                 | phc:AST_constant" />

  </past:Op>
</xsl:template>

<xsl:template match="phc:AST_unary_op" >
  <past:Op >
    <xsl:attribute name="name" >
      <xsl:value-of select="concat('prefix:', phc:Token_op/phc:value)" />
    </xsl:attribute>
    <xsl:apply-templates select="  phc:Token_int
                                 | phc:Token_real
                                 | phc:AST_bin_op
                                 | phc:AST_unary_op" />
  </past:Op>
</xsl:template>

<!-- value assignment -->
<xsl:template match="phc:AST_assignment[string(phc:bool) = 'false']" >
  <past:Op name='infix:=' pasttype='bind' >
    <xsl:apply-templates select="phc:AST_variable" />
    <xsl:apply-templates select="  phc:Token_string
                                 | phc:Token_int
                                 | phc:AST_bin_op
                                 | phc:AST_constant" />
  </past:Op>
</xsl:template>

<!-- aliasing -->
<xsl:template match="phc:AST_assignment[string(phc:bool) = 'true']" >
  <past:Op name='infix::=' pasttype='bind' >
    <xsl:apply-templates select="phc:AST_variable" />
    <xsl:apply-templates select="  phc:Token_string
                                 | phc:Token_int
                                 | phc:AST_bin_op
                                 | phc:AST_constant" />
  </past:Op>
</xsl:template>

<xsl:template match="phc:AST_variable" >
  <past:Var scope="package" >
    <xsl:attribute name="name" >
      <xsl:value-of select="concat( '$', phc:Token_variable_name/phc:value )" />
    </xsl:attribute>
  </past:Var>
</xsl:template>

<xsl:template match="phc:AST_variable[ phc:AST_expr_list/phc:Token_string | phc:AST_expr_list/phc:Token_int ]" >
  <past:Var scope="keyed" viviself="Undef" lvalue="1" >
    <xsl:choose>
      <xsl:when test="phc:Token_variable_name/phc:value = '_GET' or phc:Token_variable_name/phc:value = '_POST'" >
        <past:Var scope="package" >
          <xsl:attribute name="name" ><xsl:value-of select="concat( '$', phc:Token_variable_name/phc:value )" /></xsl:attribute>
        </past:Var>
      </xsl:when>
      <xsl:otherwise>
        <past:Var viviself="PhpArray" scope="package" lvalue="1" >
          <xsl:attribute name="name" ><xsl:value-of select="concat( '$', phc:Token_variable_name/phc:value )" /></xsl:attribute>
        </past:Var>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates select="  phc:AST_expr_list/phc:Token_string
                                 | phc:AST_expr_list/phc:Token_int" />
  </past:Var>
</xsl:template>

<xsl:template match="phc:AST_constant" >
  <past:Op name="constant" >
    <past:Val returns="PhpString" >
      <xsl:attribute name="value" ><xsl:value-of select="phc:Token_constant_name/phc:value" /></xsl:attribute>
    </past:Val>
  </past:Op>
</xsl:template>

<xsl:template match="phc:Token_string" >
  <past:Val returns="PhpString" >
    <xsl:attribute name="encoding" ><xsl:value-of select="phc:value/@encoding" /></xsl:attribute>
    <xsl:attribute name="value" ><xsl:value-of select="phc:value" /></xsl:attribute>
  </past:Val>
</xsl:template>

<xsl:template match="phc:Token_int" >
  <past:Val returns="PhpInteger" >
    <xsl:attribute name="value" ><xsl:value-of select="phc:value" /></xsl:attribute>
  </past:Val>
</xsl:template>

<xsl:template match="phc:Token_bool" >
  <past:Val returns="PhpBoolean" >
    <xsl:attribute name="value" ><xsl:choose>
      <xsl:when test="phc:value = 'True'"  >1</xsl:when>
      <xsl:when test="phc:value = 'False'" >0</xsl:when>
    </xsl:choose></xsl:attribute>
  </past:Val>
</xsl:template>

<xsl:template match="phc:Token_null" >
  <past:Val returns="PhpNull" >
    <xsl:attribute name="value" >0</xsl:attribute>
  </past:Val>
</xsl:template>

<!-- looks like phc is running into a floating point issue -->
<xsl:template match="phc:Token_real" >
  <past:Val returns='PhpFloat' >
    <xsl:attribute name="value" ><xsl:value-of select="phc:source_rep" /></xsl:attribute>
  </past:Val>
</xsl:template>

<xsl:template match="  phc:value
                     | phc:source_rep" >
  <xsl:value-of select="." />
</xsl:template>

<xsl:template match="phc:AST_if" >
  <past:Op pasttype="if" >
    <xsl:apply-templates select="  phc:Token_string
                                 | phc:Token_int
                                 | phc:Token_real
                                 | phc:AST_bin_op
                                 | phc:AST_unary_op
                                 | phc:AST_variable
                                 | phc:AST_constant" />
    <past:Block blocktype="immediate" >
      <xsl:apply-templates select="phc:AST_statement_list[1]" />
    </past:Block>
    <past:Block blocktype="immediate" >
      <xsl:apply-templates select="phc:AST_statement_list[2]" />
    </past:Block>
  </past:Op>
</xsl:template>

</xsl:stylesheet>
