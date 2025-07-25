
�
�#version 300 es

layout(std140) uniform vs_uniforms
{
    mediump mat4 view_proj;
} _37;

out mediump vec2 var_texcoord0;
layout(location = 1) in mediump vec2 texcoord0;
out mediump vec4 var_color;
layout(location = 2) in mediump vec4 color;
layout(location = 0) in mediump vec3 position;

void main()
{
    var_texcoord0 = texcoord0;
    var_color = vec4(color.xyz * color.w, color.w);
    gl_Position = _37.view_proj * vec4(position, 1.0);
}

 
�
�#version 300 es
precision mediump float;
precision highp int;

uniform mediump sampler2D texture_sampler;

layout(location = 0) out highp vec4 out_fragColor;
in vec2 var_texcoord0;
in vec4 var_color;

void main()
{
    out_fragColor = texture(texture_sampler, var_texcoord0) * var_color;
}


�
�#version 100

struct vs_uniforms
{
    mediump mat4 view_proj;
};

uniform vs_uniforms _37;

varying mediump vec2 var_texcoord0;
attribute mediump vec2 texcoord0;
varying mediump vec4 var_color;
attribute mediump vec4 color;
attribute mediump vec3 position;

void main()
{
    var_texcoord0 = texcoord0;
    var_color = vec4(color.xyz * color.w, color.w);
    gl_Position = _37.view_proj * vec4(position, 1.0);
}

 
�
�#version 100
precision mediump float;
precision highp int;

uniform mediump sampler2D texture_sampler;

varying vec2 var_texcoord0;
varying vec4 var_color;

void main()
{
    gl_FragData[0] = texture2D(texture_sampler, var_texcoord0) * var_color;
}

�
+
vs_uniforms��������#  %* 0 8 @ PX@D
texture_sampler�랦���
  *texture_sampler0�랦���8@ P"8
positionƫ����ĭ�  ,*position0ƫ����ĭ�8 @ P":
	texcoord0����ۜ���  *	texcoord00����ۜ���8 @P"0
color������X  *color0������X8 @P"@
var_texcoord0�������  *var_texcoord00�������8 @ P":
	var_color����铵��  *	var_color0����铵��8 @P*@
var_texcoord0�������  	*var_texcoord00�������8 @ P*:
	var_color����铵��  *	var_color0����铵��8 @P*B
out_fragColor�������  	*out_fragColor0�������8 @ P28
vs_uniforms��������#
	view_proj���̤�	  ( 