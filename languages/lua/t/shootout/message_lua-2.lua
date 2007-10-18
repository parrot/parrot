-- The Great Computer Language Shootout
-- http://shootout.alioth.debian.org/
-- contributed by Mike Pall

local co = coroutine
local wrap, yield = co.wrap, co.yield
if co.cstacksize then co.cstacksize(1) end -- Use minimum C stack.

local function link(n)
  if n > 1 then
    local cofunc = wrap(link)
    cofunc(n-1)
    yield()
    repeat yield(cofunc() + 1) until false
  else
    repeat yield(1) until false
  end
end

local N = tonumber(arg and arg[1]) or 10
local cofunc = wrap(link)
cofunc(500)
local count = 0
for i = 1,N do count = count + cofunc() end
io.write(count, "\n")

