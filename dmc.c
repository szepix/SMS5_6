const int D=100;
float y_zad = 1500;

float dU=0;
float dUP[D-1]; //zera z matlaba

float Ku[D-1]; //z matlaba
float Ke;      //z matlaba

float DMC(float u_prev, float y)
{
    //shift DU
    for(int i=D-2; i>0 ;i--)	{
		dUP[i]=dUP[i-1];
	}
	dUP[0] = dU;

    //calculate u
	float e = y_zad - y;
    float KdUP =0;
	for(int i = 0; i< D-1; i++){
		KdUP += Ku[i]*dUP[i];
	}
	dU = Ke*e - KdUP;
    float u = u_prev+dU;
	return u;
}

int main(){
    return 0;
}
