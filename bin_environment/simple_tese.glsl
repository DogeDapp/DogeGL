#version 400 core

layout(triangles, equal_spacing, cw) in;

in Data {
    vec3 normal;
    vec2 texcoord;
} inData[];

out Data {
    vec3 normal;
    vec2 texcoord;
    vec3 position;
} outData;

//in vec3 teNormal[];
//in vec2 teTexcoord[];

//out vec3 fNormal;
//out vec2 fTexcoord;

// Uniform

uniform mat4 MVP;

void main()
{
        gl_Position.xyzw =  gl_in[0].gl_Position.xyzw * gl_TessCoord.x +
                            gl_in[1].gl_Position.xyzw * gl_TessCoord.y +
                            gl_in[2].gl_Position.xyzw * gl_TessCoord.z;

        outData.normal = inData[0].normal * gl_TessCoord.x + inData[1].normal * gl_TessCoord.y + inData[2].normal * gl_TessCoord.z;
        outData.texcoord = inData[0].texcoord * gl_TessCoord.x + inData[1].texcoord * gl_TessCoord.y + inData[2].texcoord * gl_TessCoord.z;

//        fNormal = teNormal[0] * gl_TessCoord.x + teNormal[1] * gl_TessCoord.y + teNormal[2] * gl_TessCoord.z;
//        fTexcoord = teTexcoord[0] * gl_TessCoord.x + teTexcoord[1] * gl_TessCoord.y + teTexcoord[2] * gl_TessCoord.z;

//        if (!(gl_TessCoord.x != 0 && gl_TessCoord.y != 0 && gl_TessCoord.z != 0)){
//            gl_Position.xyz += normalize(gl_Position.xyz);
//        }

        gl_Position.xyz = 3*normalize(gl_Position.xyz);

        outData.normal = gl_Position.xyz;
        outData.position = gl_Position.xyz;

        gl_Position = MVP * gl_Position;



}
