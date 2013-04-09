#version 420

in vec3 vertexLocation;
in vec3 vertexNormal;
in vec2 vertexTexCoord;

uniform mat4 modelviewMatrix;
uniform mat4 projectionMatrix;

out vec3 v;
out vec3 N;

void main() {
    vec4 vLoc = vec4(vertexLocation, 1.0);
    mat3 normalMatrix = mat3(transpose(inverse(modelviewMatrix)));

    v = (modelviewMatrix * vLoc).xyz;
    N = normalize(normalMatrix * vertexNormal);
        
    gl_Position = projectionMatrix * modelviewMatrix * vLoc;
}
