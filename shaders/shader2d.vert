#version 450
layout(location = 0) out vec3 fragColor;

layout(binding = 0) uniform UniformBufferObject {
    vec2 offset;
} ubo;

vec2 positions[4] = vec2[](
    vec2(-0.5, -0.5), // Bottom-left
    vec2(-0.5,  0.5), // Top-left
    vec2( 0.5,  0.5), // Top-right
    vec2( 0.5, -0.5)  // Bottom-right
);

uint indices[6] = uint[](
    0, 1, 2, // First triangle
    0, 2, 3  // Second triangle
);

vec3 colors[4] = vec3[](
    vec3(1.0, 0.0, 0.0), // Red
    vec3(0.0, 1.0, 0.0), // Green
    vec3(0.0, 0.0, 1.0), // Blue
    vec3(1.0, 1.0, 0.0)  // Yellow
);

void main() {
    uint idx = indices[gl_VertexIndex];
    vec2 translatedPosition = positions[idx] + ubo.offset;
    gl_Position = vec4(translatedPosition, 0.0, 1.0);
    fragColor = colors[idx];
}