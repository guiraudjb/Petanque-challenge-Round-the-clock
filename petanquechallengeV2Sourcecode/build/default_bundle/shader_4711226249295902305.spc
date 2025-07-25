
�
�#version 300 es

layout(std140) uniform vs_uniforms
{
    mat4 view_proj;
} _55;

out mediump vec2 var_texcoord0;
layout(location = 1) in mediump vec2 texcoord0;
out mediump vec4 var_face_color;
layout(location = 2) in mediump vec4 face_color;
out mediump vec4 var_outline_color;
layout(location = 3) in mediump vec4 outline_color;
out mediump vec4 var_layer_mask;
layout(location = 5) in mediump vec3 layer_mask;
out mediump vec4 var_shadow_color;
layout(location = 4) in mediump vec4 shadow_color;
layout(location = 0) in mediump vec4 position;
out mediump float var_is_single_layer;

void main()
{
    var_texcoord0 = texcoord0;
    var_face_color = face_color;
    var_outline_color = outline_color;
    var_layer_mask.x = layer_mask.x;
    var_layer_mask.y = layer_mask.y;
    var_layer_mask.z = layer_mask.z;
    var_layer_mask.w = (var_layer_mask.x * var_layer_mask.y) * var_layer_mask.z;
    var_shadow_color = shadow_color;
    gl_Position = _55.view_proj * vec4(position.x, position.y, position.z, 1.0);
}

 
�
�#version 300 es
precision mediump float;
precision highp int;

uniform mediump sampler2D texture_sampler;

in vec4 var_layer_mask;
in vec2 var_texcoord0;
in vec4 var_face_color;
in vec4 var_outline_color;
in vec4 var_shadow_color;
layout(location = 0) out highp vec4 out_fragColor;

void main()
{
    vec4 _29 = texture(texture_sampler, var_texcoord0);
    float _37 = _29.x;
    float _38 = var_face_color.w * _37;
    highp float hp_copy_38 = _38;
    highp float _56 = min(var_outline_color.w * _29.y, (-hp_copy_38) * var_layer_mask.w + 1.0);
    vec4 _86 = vec4(var_face_color.xyz, 1.0) * var_layer_mask.x;
    highp vec4 hp_copy_86 = _86;
    highp vec4 _88 = hp_copy_86 * hp_copy_38;
    vec4 mp_copy_88 = _88;
    highp vec4 _100 = (vec4(var_outline_color.xyz, 1.0) * var_layer_mask.y) * _56;
    vec4 mp_copy_100 = _100;
    highp vec4 _112 = (vec4(var_shadow_color.xyz, 1.0) * var_layer_mask.z) * min(var_shadow_color.w * _29.z, (-(var_face_color.w * _37 + _56)) * var_layer_mask.w + 1.0);
    vec4 mp_copy_112 = _112;
    out_fragColor = (mp_copy_88 + mp_copy_100) + mp_copy_112;
}


�
�#version 100

struct vs_uniforms
{
    mat4 view_proj;
};

uniform vs_uniforms _55;

varying mediump vec2 var_texcoord0;
attribute mediump vec2 texcoord0;
varying mediump vec4 var_face_color;
attribute mediump vec4 face_color;
varying mediump vec4 var_outline_color;
attribute mediump vec4 outline_color;
varying mediump vec4 var_layer_mask;
attribute mediump vec3 layer_mask;
varying mediump vec4 var_shadow_color;
attribute mediump vec4 shadow_color;
attribute mediump vec4 position;
varying mediump float var_is_single_layer;

void main()
{
    var_texcoord0 = texcoord0;
    var_face_color = face_color;
    var_outline_color = outline_color;
    var_layer_mask.x = layer_mask.x;
    var_layer_mask.y = layer_mask.y;
    var_layer_mask.z = layer_mask.z;
    var_layer_mask.w = (var_layer_mask.x * var_layer_mask.y) * var_layer_mask.z;
    var_shadow_color = shadow_color;
    gl_Position = _55.view_proj * vec4(position.x, position.y, position.z, 1.0);
}

 
�
�#version 100
precision mediump float;
precision highp int;

uniform mediump sampler2D texture_sampler;

varying vec4 var_layer_mask;
varying vec2 var_texcoord0;
varying vec4 var_face_color;
varying vec4 var_outline_color;
varying vec4 var_shadow_color;

void main()
{
    vec4 _29 = texture2D(texture_sampler, var_texcoord0);
    float _37 = _29.x;
    float _38 = var_face_color.w * _37;
    highp float hp_copy_38 = _38;
    highp float _56 = min(var_outline_color.w * _29.y, (-hp_copy_38) * var_layer_mask.w + 1.0);
    vec4 _86 = vec4(var_face_color.xyz, 1.0) * var_layer_mask.x;
    highp vec4 hp_copy_86 = _86;
    highp vec4 _88 = hp_copy_86 * hp_copy_38;
    vec4 mp_copy_88 = _88;
    highp vec4 _100 = (vec4(var_outline_color.xyz, 1.0) * var_layer_mask.y) * _56;
    vec4 mp_copy_100 = _100;
    highp vec4 _112 = (vec4(var_shadow_color.xyz, 1.0) * var_layer_mask.z) * min(var_shadow_color.w * _29.z, (-(var_face_color.w * _37 + _56)) * var_layer_mask.w + 1.0);
    vec4 mp_copy_112 = _112;
    gl_FragData[0] = (mp_copy_88 + mp_copy_100) + mp_copy_112;
}

�

+
vs_uniforms��������#  7* 0 8 @ PX@D
texture_sampler�랦���
  *texture_sampler0�랦���8@ P"8
positionƫ����ĭ�  =*position0ƫ����ĭ�8 @ P":
	texcoord0����ۜ���  *	texcoord00����ۜ���8 @P":

face_colorϛ����  *
face_color0ϛ����8 @P"@
outline_color����͛��E  *outline_color0����͛��E8 @P"@
shadow_color��񊥨ϸ�  1*shadow_color0��񊥨ϸ�8 @P"<

layer_mask��Çت��  *
layer_mask0��Çت��8 @P"@
var_texcoord0�������  *var_texcoord00�������8 @ P"D
var_face_color໫𺙫��   *var_face_color0໫𺙫��8 @P"H
var_outline_color���ϲ��X  (*var_outline_color0���ϲ��X8 @P"F
var_shadow_color��������F  :*var_shadow_color0��������F8 @P"D
var_layer_mask�ڤ�ʼ���  *var_layer_mask0�ڤ�ʼ���8 @P*@
var_texcoord0�������  	*var_texcoord00�������8 @ P*D
var_face_color໫𺙫��  *var_face_color0໫𺙫��8 @P*H
var_outline_color���ϲ��X  *var_outline_color0���ϲ��X8 @P*F
var_shadow_color��������F  0*var_shadow_color0��������F8 @P*D
var_layer_mask�ڤ�ʼ���  *var_layer_mask0�ڤ�ʼ���8 @P*N
var_is_single_layer���������  H*var_is_single_layer0���������8 @P*B
out_fragColor�������  r*out_fragColor0�������8 @ P28
vs_uniforms��������#
	view_proj���̤�	  ( 