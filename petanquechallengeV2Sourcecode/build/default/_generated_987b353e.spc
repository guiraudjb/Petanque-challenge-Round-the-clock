
�
�#version 330

layout(std140) uniform vs_uniforms
{
    mat4 view_proj;
} _55;

out vec2 var_texcoord0;
layout(location = 1) in vec2 texcoord0;
out vec4 var_face_color;
layout(location = 2) in vec4 face_color;
out vec4 var_outline_color;
layout(location = 3) in vec4 outline_color;
out vec4 var_layer_mask;
layout(location = 5) in vec3 layer_mask;
out vec4 var_shadow_color;
layout(location = 4) in vec4 shadow_color;
layout(location = 0) in vec4 position;
out float var_is_single_layer;

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

 
�
�#version 330

uniform sampler2D texture_sampler;

in vec4 var_layer_mask;
in vec2 var_texcoord0;
in vec4 var_face_color;
in vec4 var_outline_color;
in vec4 var_shadow_color;
layout(location = 0) out vec4 out_fragColor;

void main()
{
    vec4 _29 = texture(texture_sampler, var_texcoord0);
    float _37 = _29.x;
    float _38 = var_face_color.w * _37;
    float _56 = min(var_outline_color.w * _29.y, (-_38) * var_layer_mask.w + 1.0);
    out_fragColor = (((vec4(var_face_color.xyz, 1.0) * var_layer_mask.x) * _38) + ((vec4(var_outline_color.xyz, 1.0) * var_layer_mask.y) * _56)) + ((vec4(var_shadow_color.xyz, 1.0) * var_layer_mask.z) * min(var_shadow_color.w * _29.z, (-(var_face_color.w * _37 + _56)) * var_layer_mask.w + 1.0));
}


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


�
�#version 430

layout(binding = 0, std140) uniform vs_uniforms
{
    mat4 view_proj;
} _55;

layout(location = 0) out vec2 var_texcoord0;
layout(location = 1) in vec2 texcoord0;
layout(location = 1) out vec4 var_face_color;
layout(location = 2) in vec4 face_color;
layout(location = 2) out vec4 var_outline_color;
layout(location = 3) in vec4 outline_color;
layout(location = 4) out vec4 var_layer_mask;
layout(location = 5) in vec3 layer_mask;
layout(location = 3) out vec4 var_shadow_color;
layout(location = 4) in vec4 shadow_color;
layout(location = 0) in vec4 position;
layout(location = 5) out float var_is_single_layer;

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

 
�
�#version 430

layout(binding = 0) uniform sampler2D texture_sampler;

layout(location = 4) in vec4 var_layer_mask;
layout(location = 0) in vec2 var_texcoord0;
layout(location = 1) in vec4 var_face_color;
layout(location = 2) in vec4 var_outline_color;
layout(location = 3) in vec4 var_shadow_color;
layout(location = 0) out vec4 out_fragColor;

void main()
{
    vec4 _29 = texture(texture_sampler, var_texcoord0);
    float _37 = _29.x;
    float _38 = var_face_color.w * _37;
    float _56 = min(var_outline_color.w * _29.y, fma(-_38, var_layer_mask.w, 1.0));
    out_fragColor = (((vec4(var_face_color.xyz, 1.0) * var_layer_mask.x) * _38) + ((vec4(var_outline_color.xyz, 1.0) * var_layer_mask.y) * _56)) + ((vec4(var_shadow_color.xyz, 1.0) * var_layer_mask.z) * min(var_shadow_color.w * _29.z, fma(-fma(var_face_color.w, _37, _56), var_layer_mask.w, 1.0)));
}


�
�#     I                 GLSL.std.450                      main    	                        0   1   3   =   H        �        main      	   var_texcoord0        texcoord0        var_face_color       face_color       var_outline_color        outline_color        var_layer_mask       layer_mask    0   var_shadow_color      1   shadow_color      3   gl_Position   5   vs_uniforms   5       view_proj     7         =   position      H   var_is_single_layer G  	       G  	          G         G           G         G         G           G         G           G         G         G           G         G           G         G         G           G         G           G         G  '       G  )       G  *       G  ,       G  -       G  0       G  0         G  1       G  1         G  2       G  3          G  5      H  5          H  5             H  5       #       G  7   !       G  7   "       G  =       G  =          G  @       G  B       G  D       G  F       G  H       G  H              !                                        ;     	         
         ;  
                                ;                       ;           ;           ;           ;                                  ;                        +                        +            +     #      +     .      ;     0      ;     1      ;     3        4           5   4      6      5   ;  6   7        8          +  8   9          :      4   ;     =         >         +     E     �?;     H      6               �     =           >  	      =           >        =           >        =           A              Q               >        A     !          Q     "         >  !   "   A     $      #   Q     %         >  $   %   =     '      =     )   !   �     *   '   )   =     ,   $   �     -   *   ,   A     /      .   >  /   -   =     2   1   >  0   2   A  :   ;   7   9   =  4   <   ;   A  >   ?   =      =     @   ?   A  >   A   =       =     B   A   A  >   C   =   #   =     D   C   P     F   @   B   D   E   �     G   <   F   >  3   G   �  8   
�
�#     z                 GLSL.std.450                     main              (   :   r                �        main         var_layer_mask       texture_sampler      var_texcoord0         var_face_color    (   var_outline_color     :   var_shadow_color      r   out_fragColor   G         G           G         G         G     !       G     "      G         G         G            G         G         G          G            G  "       G  %       G  &       G  (       G  (         G  *       G  -       G  .       G  :       G  :         G  <       G  ?       G  @       G  O       G  P       G  R       G  S       G  T       G  U       G  V       G  [       G  \       G  ^       G  _       G  `       G  a       G  b       G  g       G  h       G  j       G  k       G  l       G  m       G  n       G  r          G  u       G  w            !                   	            
      	   ;  
                      +                        	                                                  ;                                   ;           ;  
          +     #       ;  
   (      +     +      +     0     �?;  
   :      +     =         q      	   ;  q   r      6               �     A              =           =           =           W  	            A     !          =     "   !   Q     %          �     &   "   %   A     )   (      =     *   )   Q     -         �     .   *   -        x   &        4      2   x      0        8      %   .   4   A     ;   :      =     <   ;   Q     ?         �     @   <   ?        D      2   "   %   8        y   D        G      2   y      0        K      %   @   G   A     N      #   =     O   N   =  	   P       Q     R   P       Q     S   P      Q     T   P      P  	   U   R   S   T   0   �  	   V   U   O   �  	   X   V   &   A     Z      +   =     [   Z   =  	   \   (   Q     ^   \       Q     _   \      Q     `   \      P  	   a   ^   _   `   0   �  	   b   a   [   �  	   d   b   8   A     f      =   =     g   f   =  	   h   :   Q     j   h       Q     k   h      Q     l   h      P  	   m   j   k   l   0   �  	   n   m   g   �  	   p   n   K   �  	   u   X   d   �  	   w   u   p   >  r   w   �  8  �

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