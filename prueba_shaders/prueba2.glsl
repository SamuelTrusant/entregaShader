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
	c[1] += .1;
	c[2] += .1;
	float l,z=u_time;
	for(int i=0;i<3;i++) {
		vec2 uv,p=gl_FragCoord.xy/u_resolution;
		uv=p;
		//p-=0.5;
		p-=u_mouse/u_resolution;
		//p.x*=u_resolution.x/u_resolution.y;
		z+=0.07;
		l=length(p)*4;
		uv+=p/l*(sin(z)+2.)*abs(sin(l*9.-z*2.));
		c[i]+=0.01/length(abs(uv-.5));
	}
	c[0] = 0;
	c[1] = 0;
	//c[2] = 0;
	gl_FragColor=vec4(c/l,u_time);
}