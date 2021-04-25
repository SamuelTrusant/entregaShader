#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

//#define t u_Time
//#define r u_Resolution.xy

void main(){
	vec3 c;
	float l,z=u_time;
	for(int i=0;i<3;i++) {
		vec2 uv,p=gl_FragCoord.xy/u_resolution;
		uv=p;
		p-=0.5;
		p.x*=u_resolution.x/u_resolution.y;
		z+=0.07;
		l=length(p);
		uv+=p/l*(sin(z)+1.)*abs(sin(l*9.-z*2.));
		c[i]=0.01/length(abs(mod(uv,1.)-.5));
	}
	gl_FragColor=vec4(c/l,u_time);
}