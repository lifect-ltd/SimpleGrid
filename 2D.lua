local SimpleGrid2D = {}
SimpleGrid2D.__index = SimpleGrid2D

function SimpleGrid2D.new(XSize: number, ZSize: number, Spacing: number?, Position: Vector3?)
	local nGrid = {}
	
	nGrid.XSize = XSize
	nGrid.ZSize = ZSize
	nGrid.Spacing = Spacing or 1
	nGrid.Position = Position or Vector3.new(0, 0, 0)
	
	nGrid.Nodes = {}
	
	return setmetatable(nGrid, SimpleGrid2D)
end

function SimpleGrid2D:createNodes()
	for X = 1, self.XSize do
		for Z = 1, self.ZSize do
			self.Nodes[#self.Nodes + 1] = Vector3.new(
                self.Position.X + (X * self.Spacing),
                self.Position.Y,
                self.Position.Z + (Z * self.Spacing)
            )
		end
	end
end

function SimpleGrid2D:snapPosition(Position: Vector3)
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

return SimpleGrid2D