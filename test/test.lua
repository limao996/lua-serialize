local M = require('serialize')

local data1 = M.serialize { -- 写入多条数据
    ['1'] = -1, [6553565535] = 65535,
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
    a = 1, b = 1.0, c = 3.14, d = 'hello',
    e = false, f = { 1, 2, 3, { [3.14] = 123 } },
    g = {
        -1,
        -2,
        -3,
        a = 0,
        b = 1,
        c = -2,
        d = { -32 },
        e = M.serialize
    }, [M.deserialize] = { function() end }, [false] = false
}
local data2 = M.serialize('Hello, World!')
local data3 = M.serialize(math.pi)

local data = table.concat { data1, data2, data3 }

local res, pos = M.deserialize(data)
print(res[false])
res, pos = M.deserialize(data, pos)
print(res)
res, pos = M.deserialize(data, pos)
print(res)
