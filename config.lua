--------------------------------------------------------------
-- Config
--------------------------------------------------------------

Checkrate = 10000 -- (10000 = 10sec) Every (Checkrate) check what player doing (Run / Walking / Standing) then remove value of action

RefreshBody = 5 -- (Minutes) Every (RefreshBody) check metaweight then, update body type

Weight = {
    Standing = 0.001,       -- When standing
    Walking = 0.003,        -- When walking
    Running = 0.005,        -- When running
}

--------------------------------------------------------------
-- Debug
--------------------------------------------------------------

Debug = false -- Add command for debug