# -*- coding: utf-8 -*-

# select which prisms u want with the parameters
# n = 6
# r = 0.7
# h = 3


# using GL_TRIANGLE_FAN primitive
from OpenGL.GLUT import *
from OpenGL.GLU import *
from OpenGL.GL import *
import math

verticesCirc = (
  (0,0,1),
  (0,0,-1)
)

def Prism():
  test = 0

def polygonVerticesGenerator(sides, radius, yAxis):
  vertices = []
  ang = 2 * math.pi / sides  
  for i in range(0,sides):
    t = ang * i
    x = radius * math.cos(t)
    z = radius * math.sin(t)
    # print (x,y,zAxis)
    vertices.append((x,yAxis,z))
  return vertices
   
#juntar vertice e vertice seguinte
#no ultimo vertice, juntar com o primeiro 
#def connectPolygonVertices(vertices):


#conecta pontos entre os poligonos
def wireframe(vertices1,vertices2):
  glColor3fv((0,0.5,0))
  glBegin(GL_LINES)
  for vertex in range(0,len(vertices1)):
    if vertex != len(vertices1)-1:
      glVertex3fv(vertices1[vertex])
      glVertex3fv(vertices1[vertex+1])
      glVertex3fv(vertices2[vertex])
      glVertex3fv(vertices2[vertex+1])
    else:
      glVertex3fv(vertices1[vertex])
      glVertex3fv(vertices1[0])
      glVertex3fv(vertices2[vertex])
      glVertex3fv(vertices2[0])
  glEnd()

#gera face superior e inferior do prisma
def polygonFaceGenerator(vertices):
  glBegin(GL_POLYGON)
  for vertex in range(0,len(vertices)):
    #glVertex3f(vertices[vertex][0], vertices[vertex][1], vertices[vertex][2])
    glVertex3fv(vertices[vertex])
  glEnd()

#gera face dos lados
#pega dois pontos das duas imagens e junta
#no final da lista, utiliza o ũltimo e o primeiro de ambas as listas
def sideFacesGenerator(vertices1, vertices2):
  for vertex in range(0,len(vertices1)):
  #for vertex in range(0,1):
    if vertex != len(vertices1)-1:
      glBegin(GL_POLYGON)
      #glVertex3f(vertices1[vertex][0], vertices1[vertex][1], vertices1[vertex][2])
      glVertex3fv(vertices1[vertex])
      glVertex3fv(vertices1[vertex+1])
      glVertex3fv(vertices2[vertex+1])
      glVertex3fv(vertices2[vertex])
      glEnd()
    else:
      glBegin(GL_POLYGON)
      glVertex3fv(vertices1[vertex])
      glVertex3fv(vertices1[0])
      glVertex3fv(vertices2[0])
      glVertex3fv(vertices2[vertex])
      glEnd()
      


def display():
  glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT)
  glRotatef(2,1,3,0)

  #vars
  radius = 0.6
  sides = 5
  trunk = 0.4
  dVPolygon = polygonVerticesGenerator(sides, radius, -1+trunk)
  uVPolygon = polygonVerticesGenerator(sides, radius, 1-trunk)

  #polygonLinesGenerator(dVPolygon, uVPolygon)
  wireframe(dVPolygon, uVPolygon)

  glColor3fv((0.05,0,0))
  polygonFaceGenerator(dVPolygon)
  polygonFaceGenerator(uVPolygon)
  sideFacesGenerator(dVPolygon, uVPolygon)

  glutSwapBuffers()

def timer(i):
    glutPostRedisplay()
    glutTimerFunc(50,timer,1)

# PROGRAMA PRINCIPAL
glutInit(sys.argv)
glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGBA | GLUT_DEPTH | GLUT_MULTISAMPLE)
glutInitWindowSize(800,600)
glutCreateWindow("Prisms")
glutDisplayFunc(display)
glEnable(GL_MULTISAMPLE)
glEnable(GL_DEPTH_TEST)
glClearColor(0.,0.,0.,1.)
gluPerspective(20,800.0/600.0,0.1,50.0)
glTranslatef(0.0,0.0,-10)
glRotatef(0,0,0,0)
glutTimerFunc(50,timer,1)
glutMainLoop()
