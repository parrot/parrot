#! perl -w
# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id: object.t 11446 2006-02-06 14:07:49Z fperrad $

=head1 NAME

t/object.t - Lua object

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/object.t

=head1 DESCRIPTION

See "Programming in Lua", section 16 "Object-Oriented Programming".

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 8;
use Test::More;

language_output_is( 'lua', <<'CODE', <<'OUT', 'object' );
Account = {balance = 0}

function Account.withdraw (self, v)
    self.balance = self.balance - v
end

a1 = Account; Account = nil
a1.withdraw(a1, 100.00)
print(a1.balance)

a2 = {balance = 0, withdraw = a1.withdraw}
a2.withdraw(a2, 260.00)
print(a2.balance)
CODE
-100
-260
OUT


language_output_is( 'lua', <<'CODE', <<'OUT', 'object' );
Account = {balance = 0}

function Account:withdraw (v)
    self.balance = self.balance - v
end

a = Account
a:withdraw(100.00)
print(a.balance)
CODE
-100
OUT


language_output_is( 'lua', <<'CODE', <<'OUT', 'object' );
Account = { balance = 0,
            withdraw = function (self, v)
                           self.balance = self.balance -v
                       end
          }

function Account:deposit (v)
    self.balance = self.balance + v
end

Account.deposit(Account, 200.00)
print(Account.balance)
Account:withdraw(100.00)
print(Account.balance)
CODE
200
100
OUT


language_output_is( 'lua', <<'CODE', <<'OUT', 'classe' );
Account = {balance = 0}

function Account:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Account:deposit (v)
    self.balance = self.balance + v
end

function Account:withdraw (v)
    self.balance = self.balance - v
end

a = Account:new{balance = 0}
a:deposit(100.00)
print(a.balance)

b = Account:new()
print(b.balance)
b:deposit(200.00)
print(b.balance)
CODE
100
0
200
OUT


language_output_is( 'lua', <<'CODE', <<'OUT', 'inheritance' );
Account = {balance = 0}

function Account:new (o)
--    print "Account:new"
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Account:deposit (v)
--    print "Account:deposit"
    self.balance = self.balance + v
end

function Account:withdraw (v)
--    print "Account:withdraw"
    if v > self.balance then error"insuficient funds" end
    self.balance = self.balance - v
end

a = Account:new()
print(a.balance)
-- r, msg = pcall(Account.withdraw, a, 100)
-- print(msg)

SpecialAccount = Account:new()

function SpecialAccount:withdraw (v)
--    print "SpecialAccount:withdraw"
    if self.balance - v <= -self:getLimit() then
        error"insuficient funds"
    end
    self.balance = self.balance - v
end

function SpecialAccount:getLimit ()
--    print "SpecialAccount:getLimit"
    return self.limit or 0
end

s = SpecialAccount:new{limit=1000.00}

s:deposit(100.00)
print(s.balance)

s:withdraw(200.00)
print(s.balance)
CODE
0
100
-100
OUT

TODO: {
local $TODO = "fix me";

language_output_is( 'lua', <<'CODE', <<'OUT', 'multiple inheritance' );
-- look up for 'k' in list of tables 'plist'
local function search (k, plist)
    for i=1, table.getn(plist) do
        local v = plist[i][k]  -- try 'i'-th superclass
        if v then return v end
    end
end

function createClass (...)
    local c = {}  -- new class
    local arg = {...}

    -- class will search for each method in the list of its
    -- parents ('arg' is the list of parents)
    setmetatable(c, {__index = function (t, k)
        return search(k, arg)
    end})

    -- prepare 'c' to be the metatable of its instance
    c.__index = c
    
    -- define a new constructor for this new class
    function c:new (o)
        o = o or {}
        setmetatable(o, c)
        return o
    end
    
    -- return new class
    return c
end    

Account = {balance = 0}
function Account:deposit (v)
    self.balance = self.balance + v
end
function Account:withdraw (v)
    self.balance = self.balance - v
end

Named = {}
function Named:getname ()
    return self.name
end
function Named:setname (n)
    self.name = n
end

NamedAccount = createClass(Account, Named)

account = NamedAccount:new{name = "Paul"}
print(account:getname())
account:deposit(100.00)
print(account.balance)
CODE
Paul
100
OUT
}

language_output_is( 'lua', <<'CODE', <<'OUT', 'privacy' );
function newAccount (initialBalance)
    local self = {balance = initialBalance}
    
    local withdraw = function (v)
                         self.balance = self.balance - v
                     end

    local deposit = function (v)
                        self.balance = self.balance + v
                    end

    local getBalance = function () return self.balance end
    
    return {
        withdraw = withdraw,
        deposit = deposit,
        getBalance = getBalance
    }
end

acc1 = newAccount(100.00)
acc1.withdraw(40.00)
print(acc1.getBalance())
CODE
60
OUT


language_output_is( 'lua', <<'CODE', <<'OUT', 'single-method approach' );
function newObject (value)
    return function (action, v)
        if action == "get" then return value
        elseif action == "set" then value = v
        else error("invalid action")
        end
    end
end

d = newObject(0)
print(d("get"))
d("set", 10)
print(d("get"))
CODE
0
10
OUT

