from OpenGL.GLUT import *
from OpenGL.GLU import *
from OpenGL.GL import *
import sys

name = 'ball_glut'

def display():
    glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT)
    glRotatef(1,1,1,0)
    glutWireTeapot(1)
    glutSwapBuffers()
    glutPostRedisplay()


def main():
    glutInit(sys.argv)
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH)
    glutInitWindowSize(800,600)
    glutCreateWindow("BULE")
    glClearColor(0.,0.,0.,1.)
    glutDisplayFunc(display)
    gluPerspective(45,800.0/600.0,0.1,50.0)
    glTranslatef(0.0,0.0,-10)
    glRotatef(0,0,0,0)
    glutMainLoop()


main()
