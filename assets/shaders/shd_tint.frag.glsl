precision mediump float;

varying vec2 v_uv;

uniform sampler2D u_texture;
uniform vec3 u_tint;

void main() {
    vec4 texel = texture2D(u_texture, v_uv);
    gl_FragColor = vec4(texel.rgb * u_tint, texel.a);
}
