# Some basic routines for Cola programs
# Autoincluded in generated PIR code

.sub __puts
  .param string s
  print s
.end

.sub __puti
  .param int i
  print i 
.end

.sub __putf
  .param num n
  print n 
.end

.sub __substr
  .param int i2
  .param int i1
  .param string s
  .local string sret
  substr sret, s, i1, i2
  .return(sret)
.end 

.sub __strlen
  .param string s
  .local int len 
  length len, s
  .return(len)
.end
 
.sub __strchop
  .param string s 
  chopn s, 1
  .return(s)
.end

.sub __strrep
  .param string s0
  .param int i1
  .param int i0
  .param string s1
  substr s1, i0, i1, s0
  .return (s1)
.end

.sub __ord
  .param string s
  .local int i
  ord i, s 
  .return (i) 
.end

.sub __gets
  .local string s
  read s, 512
  .return(s)
.end

.sub __sleep
  .param int sec
  sleep sec 
.end

