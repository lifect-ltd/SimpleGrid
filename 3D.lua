local SimpleGrid3D = {}
SimpleGrid3D.__index = SimpleGrid3D

function SimpleGrid3D.new(XSize: number, YSize: number, ZSize: number, Spacing: number?, Position: Vector3?)
	local nGrid = {}
	
	nGrid.XSize = XSize
	nGrid.YSize = YSize
	nGrid.ZSize = ZSize
	nGrid.Spacing = Spacing or 1
	nGrid.Position = Position or Vector3.new(0, 0, 0)
	
	nGrid.Nodes = {}
	
	return setmetatable(nGrid, SimpleGrid3D)
end

function SimpleGrid3D:createNodes()
    for X = 1, self.XSize do
        self.Nodes[X] = {}
        for Y = 1, self.YSize do
            self.Nodes[X][Y] = {}
            for Z = 1, self.ZSize do
                self.Nodes[X][Y][Z] = Vector3.new(
                    self.Position.X + (X * self.Spacing),
                    self.Position.Y + (Y * self.Spacing),
                    self.Position.Z + (Z * self.Spacing)
                )
            end
        end
    end
end

function SimpleGrid3D:snapPosition(Position: Vector3)
    local ClosestNode = nil
    local ClosestDistance = math.huge
    for _, Node in next, self.Nodes do
        local DistanceToNode = (Node - Position).Magnitude
        if DistanceToNode < ClosestDistance then
            ClosestNode = Node
            ClosestDistance = DistanceToNode
        end
    end
    return ClosestNode, ClosestDistance
end

return SimpleGrid3D