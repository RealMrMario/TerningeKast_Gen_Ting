int[] numb = new int [31];  //Array der indeholder terningekastne.
int count = 0;                //Tæller til det kast vi er nået til.

int ones = 0;                  //Tæller fra et til seks
int twos = 0;                  //
int threes = 0;                //
int fours = 0;                 //
int fives = 0;                 //
int sixes = 0;                 //

void setup() {
  size(800, 800);
  clear();
  textSize(20);
  
  text("TRYK på 'k' FOR AT KASTE", 50, 50);          //Laver setup delen. Laver tekst og mere
  text("Fordeling af terningekast", 70, 750);
  for(int x=1; x<=6; x++)text(x, 20+50*x, 700);
  textSize(14);
  for(int x = 0; x<300; x+=50)text("0 stk",60+x,660);
  
}

void draw() {
}

void keyPressed() {
  clear();
  textSize(20);
  text("TRYK på 'k' FOR AT KASTE / OG 's' FOR AT SLETTE", 50, 50);

  if ((key=='k' || key == 'K') && count < 30) {
    count++;                               //Count stiger ved at trykke på K tasten.
    int kast = lavTerningeKast(1, 7);        //Int funktion længere nede.
    text("DIT KAST BLEV:" + kast, 50, 75);
  }

  if ((key == 's' || key == 'S') && count>0) {
    fjernSidsteKast();                       //Funktion længere nede.
  }
  tegnFordeling();     //Funktion længere nede.
  
  udskrivKast();                             //Funktion længere nede.
  
  if(count==0)text("DIT KAST BLEV: ", 50, 75);
  
  if(count==30)text("DIT KAST BLEV:"+numb[count], 50, 75);
}

int lavTerningeKast(int min, int max){        
  
  int nyKast = int(random(min,max));         //Laver selve terninge kastet.
  
  numb[count] = nyKast;                 //Sætter "nyKast" ind i arrayet.
  
  if(nyKast==1)ones++;                       //Det tjekker hvilket tal det nye tal er, og tilføjer det til 'forskellige tal tælleren'.
  if(nyKast==2)twos++;                       //
  if(nyKast==3)threes++;                     //
  if(nyKast==4)fours++;                      //
  if(nyKast==5)fives++;                      //
  if(nyKast==6)sixes++;                      //
  return nyKast;
}  

void udskrivKast(){
  for(int x=1;x<=count;x++){                      //gør at der bliver lavet en talrække på højre side. Laver så mange tekst felter som counter tallet er nået til.
  text("Kast "+x+": "+numb[x],600,50+20*x);      //Viser terningekastet via arrayet med stigende x.
  }
}

void fjernSidsteKast(){
  if(numb[count]==1)ones--;                    //Fjerner sidste tal fra 'forskellige tal tælleren'
  if(numb[count]==2)twos--;                    //
  if(numb[count]==3)threes--;                  //
  if(numb[count]==4)fours--;                   //
  if(numb[count]==5)fives--;                   //
  if(numb[count]==6)sixes--;                   //
  
  count--;                            
  text("DIT KAST BLEV:" + numb[count], 50, 75); 
}

void tegnFordeling(){   
  
  text("Fordeling af terningekast", 70, 750);       
  for(int b=1; b<=6; b++){                          //gør et  en talrække fra 1-6 bliver dannet
    text(b, 20+50*b, 700);                          //
  }
  
  textSize(14);
  rect(55,670,45,ones*-20);     text(ones+" stk",60,660-ones*20);            //Laver diagrammet. Rektanglerne stiger i størrlse på negativ Y koordinatet
  rect(105,670,45,twos*-20);    text(twos+" stk",110,660-twos*20);           //i takt med at 'forskellige tal tælleren' stiger. Der er også en tekst som 
  rect(155,670,45,threes*-20);  text(threes+" stk",160,660-threes*20);       //stiger sammentidigt, så den altid er over diagrammet og tæller antal
  rect(205,670,45,fours*-20);   text(fours+" stk",210,660-fours*20);         //tal af de forskellige tal. Hvis det giver mening
  rect(255,670,45,fives*-20);   text(fives+" stk",260,660-fives*20);         //
  rect(305,670,45,sixes*-20);   text(sixes+" stk",310,660-sixes*20);         //
  textSize(20);
}
