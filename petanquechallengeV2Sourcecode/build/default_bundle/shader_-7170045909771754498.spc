
�
�#version 300 es

layout(std140) uniform vs_uniforms
{
    mat4 view_proj;
} _13;

layout(location = 0) in vec4 position;
out mediump vec2 var_texcoord0;
layout(location = 1) in mediump vec2 texcoord0;

void main()
{
    gl_Position = _13.view_proj * vec4(position.xyz, 1.0);
    var_texcoord0 = texcoord0;
}

 
�
�#version 300 es
precision mediump float;
precision highp int;

layout(std140) uniform fs_uniforms
{
    vec4 tint;
} _12;

uniform mediump sampler2D texture_sampler;

layout(location = 0) out highp vec4 out_fragColor;
in vec2 var_texcoord0;

void main()
{
    out_fragColor = texture(texture_sampler, var_texcoord0) * vec4(_12.tint.xyz * _12.tint.w, _12.tint.w);
}


�
�#version 100

struct vs_uniforms
{
    mat4 view_proj;
};

uniform vs_uniforms _13;

attribute vec4 position;
varying mediump vec2 var_texcoord0;
attribute mediump vec2 texcoord0;

void main()
{
    gl_Position = _13.view_proj * vec4(position.xyz, 1.0);
    var_texcoord0 = texcoord0;
}

 
�
�#version 100
precision mediump float;
precision highp int;

struct fs_uniforms
{
    vec4 tint;
};

uniform fs_uniforms _12;

uniform mediump sampler2D texture_sampler;

varying vec2 var_texcoord0;

void main()
{
    gl_FragData[0] = texture2D(texture_sampler, var_texcoord0) * vec4(_12.tint.xyz * _12.tint.w, _12.tint.w);
}

�
+
vs_uniforms��������#  * 0 8 @ PX@
+
fs_uniforms������ة= * 0 8@PXD
texture_sampler�랦���
  %*texture_sampler0�랦���8@ P"8
positionƫ����ĭ�  *position0ƫ����ĭ�8 @ P":
	texcoord0����ۜ���  "*	texcoord00����ۜ���8 @P"@
var_texcoord0�������  )*var_texcoord00�������8 @ P*@
var_texcoord0�������   *var_texcoord00�������8 @ P*B
out_fragColor�������  !*out_fragColor0�������8 @ P28
vs_uniforms��������#
	view_proj���̤�	  ( 24
fs_uniforms������ة=
tint�ůͧ����  ( 