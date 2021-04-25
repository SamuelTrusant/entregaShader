#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
	vec3 c;
    c[0] = 0.056;
	c[1] += -cos(u_time)/3.;
	c[2] += sin(u_time)/3.;
	float l,z=u_time;
    float m = mod(u_time,5.);
	for(int i=0;i<3;i++) {
		vec2 uv,p=gl_FragCoord.xy/u_resolution;
		uv=p;
        p.x-=(sin(u_time)/3.)+0.5;
        p.y-=(cos(u_time)/3.)+0.5;

        z+=0.07;
		l=length(p)*4.;
		uv+=p/l*(sin(z)+2.)*abs(sin(l*9.-z*2.));
        
		c[i]+=0.01/length(abs(uv-.5));
	}
	gl_FragColor=vec4(c/l,u_time);
}