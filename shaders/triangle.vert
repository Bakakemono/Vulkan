#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 proj;
} ubo;

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inColor;
layout(location = 2) in vec2 inTexCoord;
layout(location = 3) in vec3 inLightColor;
layout(location = 4) in vec3 inNormal;
layout(location = 5) in vec3 inLightDir;

layout(location = 0) out vec3 fragColor;
layout(location = 1) out vec2 fragTexCoord;
layout(location = 2) out vec3 fragLightColor;
layout(location = 3) out vec3 fragNormal;
layout(location = 4) out vec3 fragLightDir;

void main() {
    gl_Position = ubo.proj * ubo.view * ubo.model * vec4(inPosition, 1.0);
    fragColor = inColor;
    fragTexCoord = inTexCoord;
	fragLightColor = inLightColor;
	fragNormal = mat3(ubo.model) * normalize(inNormal);
	//fragNormal = inNormal;
	fragLightDir = inLightDir;
}