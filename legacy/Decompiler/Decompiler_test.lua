--[[
  Name: Decompiler_test.lua
  Author: ByteXenon [Luna Gilbert]
  Approximate date of creation: 2023/07/XX
--]]

local Decompiler = require("Decompiler/Decompiler")


local LuaState = require("LuaState/LuaState")

local helloWorldInstructions = {
  {
    OPName = "GETGLOBAL",
    A = 0,
    B = -1
  },
  {
    OPName = "LOADK",
    A = 1,
    B = -2
  },
  {
    OPName = "CALL",
    A = 0,
    B = 2,
    C = 1
  }
}

local helloWorldConstants = {
  "print",
  "hello, world!"
}

local callFirstClosureInstructions = {
  {
    OPName = "CLOSURE",
    A = 0,
    B = 0
  },
  {
    OPName = "CALL",
    A = 0,
    B = 2,
    C = 1
  }
}

-- Example usage:
local newDecompiler = Decompiler(
  callFirstClosureInstructions,
  {},
  nil,
  {
    {
      instructions = callFirstClosureInstructions,
      protos = {
        {
          instructions = helloWorldInstructions,
          constants = helloWorldConstants
        }
      }
    }
  }
)

newDecompiler:run()
local autoGeneratedCode = newDecompiler:getCode()
print( autoGeneratedCode)