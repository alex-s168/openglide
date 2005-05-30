//**************************************************************
//*            OpenGLide - Glide to OpenGL Wrapper
//*             http://openglide.sourceforge.net
//*
//*         Linux specific functions for reporting errors
//*
//*         OpenGLide is OpenSource under LGPL license
//*              Originaly made by Fabio Barros
//*      Modified by Paul for Glidos (http://www.glidos.net)
//**************************************************************

#include "platform/error.h"

void ReportWarning(const char *message)
{
    printf("Warning: %s\n", message);
}

void ReportError(const char *)
{
    printf("Error: %s\n", message);
}

