#
# Levenshtein distance
#
# implementation based on http://www.merriampark.com/ld.htm
# First implementation by Alberto Simoes (ambs <at> cpan.org)
#
# $Id$
.sub main :main
        $S1 = "stupid"
        $S2 = "one"

        $I1 = levenshtein($S1,$S2)

        print $I1
        print "\n"
        end
.end

# Levenshtein distance. Pass two strings in
.sub levenshtein
        .param string s
        .param string t

        .local int n # s size
        .local int m # t size

        .local pmc matrix
        .local int i
        .local int j

        .local string schar
        .local string tchar

        .local int cost
        .local int a
        .local int b
        .local int c

        n = length s
        m = length t

        if n == 0 goto return_m
        if m == 0 goto return_n

        new matrix, .ResizablePMCArray
        i = 0
init_matrix:
        new $P0, .ResizableIntegerArray
        matrix[i] = $P0
        i += 1
        if i <= m goto init_matrix

        i = 0
init_matrix_1:
        matrix[i;0] = i
        i += 1
        if i <= m goto init_matrix_1

        i = 0
init_matrix_2:
        matrix[0;i] = i
        i += 1
        if i <= n goto init_matrix_2

init_matrix_done:
        i = 1

cycle:  
        j = 1
inner_cycle:
        $I0 = i - 1
        $I1 = j - 1
        schar = substr s, $I1, 1
        tchar = substr t, $I0, 1

        cost = calculate_cost(schar, tchar)

        # calculate a
        a = matrix[$I0;j]
        a += 1
        # calculate b
        b = matrix[i;$I1]
        b += 1
        # calculate c
        c = matrix[$I0;$I1]
        c += cost

        cost = minimum(a,b,c)
        matrix[i;j] = cost
        
        j += 1
        if j <= n goto inner_cycle
        i += 1
        if i <= m goto cycle

        cost = matrix[m;n]
        .return(cost)
        
return_m:
        .return(m)

return_n:
        .return(n)
.end

# return (first==second)?1:0
.sub calculate_cost
        .param string first
        .param string second

        if first == second goto zero
        .return(1)
zero:
        .return(0)
.end

# return minimum(a,b,c)
.sub minimum
        .param int a
        .param int b
        .param int c

        if a < b goto other
        if b < c goto b_label
c_label:
        .return(c)
a_label:
        .return(a)
b_label:
        .return(b)
other:
        if a < c goto a_label
        goto c_label
        
.end
