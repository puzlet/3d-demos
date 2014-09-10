# set the scene size
width = 400
height = 300

#renderer = new THREE.WebGLRenderer({ alpha: true })
renderer = new THREE.CanvasRenderer({ alpha: true })
renderer.setSize width, height

container = $("#container")
container.empty()
container.append renderer.domElement

camera = new THREE.PerspectiveCamera(45, width/height, 0.1, 10000)
camera.position.z = 300

###
sphereMaterial = new THREE.MeshBasicMaterial(
    color: 0x00CC00
    wireframe: true
)
###
sphereMaterial = new THREE.MeshLambertMaterial(
    color: 0x999999
    wireframe: false
)
sphereGeom = new THREE.SphereGeometry(100, 32, 32)
sphere = new THREE.Mesh(sphereGeom, sphereMaterial)

pointLight = new THREE.PointLight(0xFFFFFF)
pointLight.position.x = 10
pointLight.position.y = 50
pointLight.position.z = 130

scene = new THREE.Scene()
scene.add sphere
scene.add camera
scene.add pointLight

renderer.render scene, camera


