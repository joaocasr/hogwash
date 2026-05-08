shader_type spatial;
render_mode unshaded, cull_disabled, blend_add;

uniform sampler2D noise_tex;
uniform vec4 fire_color : source_color = vec4(1.0, 0.45, 0.1, 1.0);

void fragment() {

    vec2 uv = UV;

    uv.y -= TIME * 1.5;
    uv.x += sin(UV.y * 10.0 + TIME * 4.0) * 0.04;

    // Noise
    float n = texture(noise_tex, uv).r;

    float width = 1.0 - UV.y;

    float flame_shape =  smoothstep(width, width - 0.35, abs(UV.x - 0.5));

    float top_fade = 1.0 - UV.y;
    float bottom_boost = smoothstep(1.0, 0.7, UV.y);

    float alpha = flame_shape * n * top_fade * bottom_boost;

    ALBEDO = fire_color.rgb;
    EMISSION = fire_color.rgb * 6.0;
    ALPHA = alpha;
}