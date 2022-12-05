const int D=100;
float y_zad = 1500;

float dU=0;
float dUP[D-1] = {0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}; //zera z matlaba

float Ku[D-1] = {0.476276, 0.475849, 0.442317, 0.393293, 0.343753, 0.291762, 0.249582, 0.205031, 0.170927, 0.138543, 0.112713, 0.094384, 0.080372, 0.066265, 0.053353, 0.042709, 0.035325, 0.028207, 0.025865, 0.021334, 0.012321, 0.014872, 0.011740, 0.010931, 0.009075, 0.012734, 0.006649, 0.002991, 0.006691, -0.003813, 0.001470, 0.003217, 0.004463, 0.000179, -0.001533, -0.002247, 0.000099, 0.000733, -0.001598}; //z matlaba
float Ke = 0.7991;      //z matlaba

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
