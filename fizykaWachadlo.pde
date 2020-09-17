void setup() {
  size(1920,1080);
    int N=1000;
  float L=100,M=1;
  float Y[][] = new float[2][N];
  float H=3*PI/L,Q=0.5,B=0.9,W=2/3;
  Y[0][0]=0;
  Y[1][0]=0;
  float T,DK11,DK21,DK12,DK22,DK13,DK23,DK14,DK24;
  for(int i=0;i<N-1;i++){
  T=H*i;
  float Y1=Y[0][i];
  float Y2=Y[1][i];
  DK11=H*G1(Y1,Y2,T);
  DK21=H*G2(Y1,Y2,T,Q,B,W);
  DK12=H*G1((Y1+DK11)/2,(Y2+DK21)/2,T);
  DK22=H*G2((Y1+DK11)/2,(Y2+DK21)/2,T,Q,B,W);
  DK13=H*G1((Y1+DK12)/2,(Y2+DK22)/2,T);
  DK23=H*G2((Y1+DK12)/2,(Y2+DK22)/2,T,Q,B,W);
  DK14=H*G1(Y1+DK13,Y2+DK23,T);
  DK24=H*G2(Y1+DK13,Y2+DK23,T,Q,B,W);
  Y[0][i+1]=Y[0][i]+(DK11+2*(DK12+DK13)+DK14)/6;
  Y[1][i+1]=Y[0][i]+(DK21+2*(DK22+DK23)+DK24)/6;
  if(abs(Y[0][i+1])<PI){
    Y[0][i+1]=Y[0][i+1]-2*PI*abs(Y[0][i+1])/Y[0][i+1];
  }
 // if(i<999){
  println(Y[0][i+1]);
  println(Y[1][i+1]);
 // }
  }

  
}
void draw(){

}
float G1(float Y1,float Y2,float T){
return Y2;}
float G2(float Y1,float Y2,float T,float Q,float B,float W){
return -Q*Y2-sin(Y1)+B*cos(W*T);
}
