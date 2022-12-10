# Content
* <a href="#2D">2D</a>
    * <a href="#2d-new">new</a>
    * <a href="#2d-createNodes">createNodes</a>
    * <a href="#2d-snapPosition">snapPosition</a>
* <a href="#3D">3D</a>
    * <a href="#3d-new">new</a>
    * <a href="#3d-createNodes">createNodes</a>
    * <a href="#3d-snapPosition">snapPosition</a>
XSize: number, ZSize: number, Spacing: number?, Position: Vector3?
# 2D
* <b id="2d-new">new</b>
    * ARG1 XSize `number`
    * ARG2 ZSize `number`
    * ARG3 Spacing `number` `optional`
    * ARG4 Position `Vector3` `optional`
    * RETURN `Grid`
* <b id="2d-createNodes">createNodes</b>
    * ARGS `NONE`
    * RETURN `NONE`
* <b id="2d-snapPosition">snapPosition</b>
    * ARG1 Position `Vector3`
    * RETURN `Corrected Grid Position`
```lua
local MyGrid = SimpleGrid2D.new(10, 10, 2, Vector3.new(0, 5, 0)) -- Create new grid 10x10 with space of 2 studs, at {0,5,0}
MyGrid:createNodes()

local CorrectedPosition, Distance = MyGrid:snapPosition(Vector3.new(4, 7, 9))
print(CorrectedPosition, Distance)
```
# 3D
* <b id="3d-new">new</b>
    * ARG1 XSize `number`
    * ARG2 YSize `number`
    * ARG3 ZSize `number`
    * ARG4 Spacing `number` `optional`
    * ARG5 Position `Vector3` `optional`
    * RETURN `Grid`
* <b id="3d-createNodes">createNodes</b>
    * ARGS `NONE`
    * RETURN `NONE`
* <b id="3d-snapPosition">snapPosition</b>
    * ARG1 Position `Vector3`
    * RETURN `Corrected Grid Position`
```lua
local MyGrid = SimpleGrid3D.new(10, 10, 10, 2, Vector3.new(0, 5, 0)) -- Create new grid 10x10x10 with space of 2 studs, at {0,5,0}
MyGrid:createNodes()

local CorrectedPosition, Distance = MyGrid:snapPosition(Vector3.new(4, 7, 9))
print(CorrectedPosition, Distance)
```