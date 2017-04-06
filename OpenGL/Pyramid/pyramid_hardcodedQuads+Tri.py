from OpenGL.GLUT import *
from OpenGL.GLU import *
from OpenGL.GL import *

vertices = (
    ( 1,-1,-1),
    ( 1,-1,1),
    (-1,-1,1),
    (-1,-1,-1),
    ( 0, 1, 0),
    )

linhas = (
    (0,1),
    (0,3),
    (0,4),
    (2,1),
    (2,3),
    (2,4),
    (1,4),
    (3,4),
    )

facesTriang = (
    (0,1,4),
    (0,3,4),
    (1,2,4),
    (2,3,4)
    )

faceQuad = (0,1,2,3)

cores = ( (1,0,0),(1,1,0),(0,1,0),(0,1,1),(0,0,1) )

#3fv = 3 floats in an array
def Prisma():
#draw face
    #how?
    glBegin(GL_TRIANGLES)
    for face in facesTriang:
        for vertex in face:
            #one color for each vertex
            glColor3fv(cores[vertex])
            glVertex3fv(vertices[vertex])
    glEnd()
    
    glBegin(GL_QUADS)
    for vertex in faceQuad:
	    glColor3fv(cores[vertex])
	    glVertex3fv(vertices[vertex])
    glEnd()

#draw wireframe
    glColor3fv((0,0.5,0))
    glBegin(GL_LINES)
    for linha in linhas:
        for vertice in linha:
            glVertex3fv(vertices[vertice])
    glEnd()

def display():
    glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT)
    glRotatef(2,1,3,0)
    Prisma()
    glutSwapBuffers()
 
def timer(i):
    glutPostRedisplay()
    glutTimerFunc(50,timer,1)

# PROGRAMA PRINCIPAL
glutInit(sys.argv)
glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGBA | GLUT_DEPTH | GLUT_MULTISAMPLE)
glutInitWindowSize(800,600)
glutCreateWindow("Prisma")
glutDisplayFunc(display)
glEnable(GL_MULTISAMPLE)
glEnable(GL_DEPTH_TEST)
glClearColor(0.,0.,0.,1.)
gluPerspective(45,800.0/600.0,0.1,50.0)
glTranslatef(0.0,0.0,-10)
glRotatef(0,0,0,0)
glutTimerFunc(50,timer,1)
glutMainLoop()


