e3d = e3d || {}

# 3D camera constructor
e3d.Camera = ->
  @position = [0,0,0]
  @rotation = [0,0,0]
  @distance = 0
  
  fovy = 45
  aspect = e3d.width / e3d.height
  near = 0.1
  far = 100
  
  eye = [0,0,0]
  target = [0,1,0]
  up = [0,0,1]
  
  @createMatrix = ->
    matrix = mat.perspective(fovy, aspect, near, far)
    matrix = mat.lookat(matrix, eye, target, up)
    matrix = mat.translate(matrix, [0,0,-@distance])
    matrix = mat.rotateZ(matrix, @rotation[2])
    matrix = mat.rotateY(matrix, @rotation[1])
    matrix = mat.rotateX(matrix, @rotation[0])
    matrix = mat.translate(matrix, vec.neg(@position))
    return matrix
  
  return