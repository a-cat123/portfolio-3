-- Query 1 - List all escape rooms
SELECT 
    RoomID, 
    Title, 
    Theme, 
    DifficultyLevel, 
    Duration
FROM 
    Escape_Rooms;
    
-- Query 2 - List players who requested the most hints

SELECT 
    Players.Name AS PlayerName, 
    COUNT(Player_Actions.ActionType) AS HintRequests
FROM 
    Player_Actions
JOIN 
    Players ON Player_Actions.PlayerID = Players.PlayerID
WHERE 
    Player_Actions.ActionType = 'HintRequest'
GROUP BY 
    Players.Name
ORDER BY 
    HintRequests DESC;
    
-- Query 3 - Find the most active players, based on number of actions   
SELECT 
    Players.Name AS PlayerName, 
    COUNT(Player_Actions.ActionID) AS TotalActions
FROM 
    Player_Actions
JOIN 
    Players ON Player_Actions.PlayerID = Players.PlayerID
GROUP BY 
    Players.Name
ORDER BY 
    TotalActions DESC;
    