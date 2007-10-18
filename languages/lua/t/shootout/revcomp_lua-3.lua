-- The Great Computer Language Shootout
-- http://shootout.alioth.debian.org/
-- contributed by Mike Pall (with ideas from Rici Lake)
-- modified by Sokolov Yura

local len, sub, concat = string.len, string.sub, table.concat
local write, mod = io.write, math.mod

local function writerev(p, np, f, lo, hi)
  if lo <= hi then np = np + 1; p[np] = concat(f, "", lo, hi) end
  if np ~= 0 then
    local r = ""
    for i=np,1,-1 do
      local s = r..p[i]
      local sn = len(s)
      for i=1,sn-59,60 do write(sub(s, i, i+59), "\n") end
      r = sub(s, sn-mod(sn, 60)+1)
    end
    if r ~= "" then write(r, "\n") end
  end
end

local iubc = setmetatable({
  A="T", C="G", B="V", D="H", K="M", R="Y",
  a="T", c="G", b="V", d="H", k="M", r="Y",
  T="A", G="C", V="B", H="D", M="K", Y="R", U="A",
  t="A", g="C", v="B", h="D", m="K", y="R", u="A",
  N="N", S="S", W="W", n="N", s="S", w="W",
}, { __index = function(t, s)
  local r = t[sub(s, 2)]..t[sub(s, 1, 1)]; t[s] = r; return r end })

local p, f, np, nf = {}, {}, 0, 1631
for line in io.lines() do
  local c = sub(line, 1, 1)
  if c == ">" then
    writerev(p, np, f, nf, 1630); np = 0; nf = 1631
    write(line, "\n")
  elseif c ~= ";" then
    for i=1,len(line),4 do nf = nf - 1; f[nf] = iubc[sub(line, i, i+3)] end
    if nf <= 30 then
      np = np + 1; p[np] = concat(f, "", nf, 1630); nf = 1631
    end
  end
end
writerev(p, np, f, nf, 1630)