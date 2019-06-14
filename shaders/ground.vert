#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 proj;
	vec4 lightPos;
	vec4 lightColor;
} ubo;

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec2 inTexCoord;
layout(location = 2) in vec3 inNormal;

layout(location = 0) out vec2 fragTexCoord;
layout(location = 1) out vec3 fragNormal;
layout(location = 2) out vec3 fragLightColor;
layout(location = 3) out vec3 fragLightPos;
layout(location = 4) out float fragLightRange;
layout(location = 5) out vec3 fragPos;

void main() {
    gl_Position = ubo.proj * ubo.view * ubo.model * vec4(inPosition, 1.0);
    fragTexCoord = inTexCoord;
	fragNormal = mat3(ubo.model) * normalize(inNormal);
	fragLightPos = vec3(ubo.lightPos);
	fragLightColor = vec3(ubo.lightColor);
	fragPos = mat3(ubo.model) * inPosition;
	fragLightRange = ubo.lightPos.w;
}