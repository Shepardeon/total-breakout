shep.scenes.sceneManager = {}
shep.scenes.sceneManager.currentScene = nil

function shep.scenes.sceneManager:switchScene(scene)
    assert(type(scene) == "table")
    assert(scene.isType("BaseScene"))

    self.currentScene = scene
    self.currentScene:init()
end

function shep.scenes.sceneManager:update(dt)
    if self.currentScene == nil then return end
    self.currentScene:update(dt)
end

function shep.scenes.sceneManager:draw()
    if self.currentScene == nil then return end
    self.currentScene:draw()
end