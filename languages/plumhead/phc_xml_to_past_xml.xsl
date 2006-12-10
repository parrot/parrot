<?xml version='1.0'?>
<xsl:stylesheet 
  xmlns:phc="http://www.phpcompiler.org/phc-1.0"
  xmlns:past="http://www.parrotcode.org/PAST-0.1"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0" >
<!--

$Id$

This transformation takes a XML abstract syntax tree as generated 
by phc from PHP source. It generates an XML equivalent to PAST-pm.

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
  <xsl:apply-templates select="phc:AST_method_invocation | phc:Token_string | phc:Token_int | phc:Token_real | phc:AST_bin_op | phc:AST_unary_op | phc:AST_variable" />
</xsl:template>

<xsl:template match="phc:AST_bin_op" >
  <past:Op>

    <xsl:attribute name="pirop" >
      <xsl:choose>
        <xsl:when test="phc:Token_op/phc:value = '+'"   >n_add</xsl:when>
        <xsl:when test="phc:Token_op/phc:value = '-'"   >n_sub</xsl:when>
        <xsl:when test="phc:Token_op/phc:value = '*'"   >n_mul</xsl:when>
        <xsl:when test="phc:Token_op/phc:value = '/'"   >n_div</xsl:when>
        <xsl:when test="phc:Token_op/phc:value = '%'"   >n_mod</xsl:when>
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
        <xsl:when test="phc:Token_op/phc:value = '==' and phc:Token_string" >infix:eq</xsl:when>
        <xsl:when test="phc:Token_op/phc:value = '!=' and phc:Token_string" >infix:ne</xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="concat('infix:', phc:Token_op/phc:value)" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>

    <xsl:apply-templates select="phc:Token_string | phc:Token_int | phc:Token_real | phc:AST_bin_op | phc:AST_unary_op | phc:AST_variable" />

  </past:Op>
</xsl:template>

<xsl:template match="phc:AST_unary_op" >
  <past:Op >
    <xsl:attribute name="name" >
      <xsl:value-of select="concat('prefix:', phc:Token_op/phc:value)" />
    </xsl:attribute>
    <xsl:apply-templates select="phc:Token_int | phc:Token_real | phc:AST_bin_op | phc:AST_unary_op" />
  </past:Op>
</xsl:template>

<xsl:template match="phc:AST_assignment" >
  <past:Op name='infix:=' pasttype='assign' >
    <xsl:apply-templates select="phc:AST_variable" />
    <xsl:apply-templates select="phc:Token_string | phc:Token_int | phc:AST_bin_op" />
  </past:Op>
</xsl:template>

<xsl:template match="phc:AST_variable" >
  <past:Var viviself=".Undef" islvalue="1" >
    <xsl:attribute name="name" ><xsl:value-of select="phc:Token_variable_name/phc:value" /></xsl:attribute>
  </past:Var>
</xsl:template>

<xsl:template match="phc:AST_variable[phc:AST_expr_list/phc:Token_string | phc:AST_expr_list/phc:Token_int]" >
  <past:Var scope="keyed" >
    <xsl:choose>
      <xsl:when test="phc:Token_variable_name/phc:value = '_GET' or phc:Token_variable_name/phc:value = '_POST'" >
        <past:Var scope="package" >
          <xsl:attribute name="name" ><xsl:value-of select="phc:Token_variable_name/phc:value" /></xsl:attribute>
        </past:Var>
      </xsl:when>
      <xsl:otherwise>
        <past:Var viviself=".Hash" islvalue="1" >
          <xsl:attribute name="name" ><xsl:value-of select="phc:Token_variable_name/phc:value" /></xsl:attribute>
        </past:Var>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates select="phc:AST_expr_list/phc:Token_string | phc:AST_expr_list/phc:Token_int" />
  </past:Var>
</xsl:template>

<xsl:template match="phc:Token_string" >
  <past:Val ctype="s~" vtype=".String" >
    <xsl:attribute name="encoding" ><xsl:value-of select="phc:value/@encoding" /></xsl:attribute>
    <xsl:attribute name="name" ><xsl:value-of select="phc:value" /></xsl:attribute>
  </past:Val>
</xsl:template>

<xsl:template match="phc:Token_int" >
  <past:Val ctype="i+" vtype=".Integer" >
    <xsl:attribute name="name" ><xsl:value-of select="phc:value" /></xsl:attribute>
  </past:Val>
</xsl:template>

<!-- looks like phc is running into a floating point issue -->
<xsl:template match="phc:Token_real" >
  <past:Val ctype="n" >
    <xsl:apply-templates select="phc:source_rep" />
  </past:Val>
</xsl:template>

<xsl:template match="phc:value | phc:source_rep" >
  <xsl:value-of select="." />
</xsl:template>

<xsl:template match="phc:AST_if" >
  <past:Op pasttype="if" >
    <xsl:apply-templates select="phc:Token_string | phc:Token_int | phc:Token_real | phc:AST_bin_op | phc:AST_unary_op | phc:AST_variable" />
    <past:Block blocktype="immediate" >
      <xsl:apply-templates select="phc:AST_statement_list[1]" />
    </past:Block>
    <past:Block blocktype="immediate" >
      <xsl:apply-templates select="phc:AST_statement_list[2]" />
    </past:Block>
  </past:Op>
</xsl:template>

</xsl:stylesheet>
