import java.util.Scanner;
public class Puzzle_15
{
    int s;
    private String[][] board;
    Puzzle_15()
    {
        this.s = 4;
        this.board = new String[s][s];
    }
    Puzzle_15(int s)
    {
        this.s = s;
    }
    public void set_board()
    {
        int fill = 0;
        for(int i = 0 ; i <= (this.s-1) ; i++)
        {
            for(int j = 0 ; j <= (this.s-1) ; j++ )
            {
                fill = ((this.s*(i))+(j+1));
                if(fill != this.s*this.s)
                {
                    if(fill >= 10)
                    {
                        board[i][j] = (""+fill);
                    }
                    else
                    {
                        board[i][j] = ("0"+fill);
                    }
                }
                
                else
                {
                     board[i][j] = ("  ");
                }
             }
         }
    }
    public void print()//
    {
        cls();
        //
        System.out.print("  ");
        for(int b = 0;b < this.s;b++)
        {
            System.out.print("-----");
        }
        //
        for(int a = 0;a < this.s;a++)
        {
            System.out.println();
            System.out.print("|  ");
            for(int b = 0;b < this.s;b++)
            {
                System.out.print(board[a][b]);
                System.out.print("   ");
                if((b == (this.s-1))&&(a == (this.s-1)))
                {
                    System.out.print("|"); 
                }
             }
            if(a != (this.s-1))
            {
               System.out.print("|");
               System.out.println();
               System.out.print("|");
               for(int b = 0;b < this.s;b++)
               {
                   System.out.print("     ");
               }
               System.out.print("  ");
               System.out.print("|"); 
            }          
        }
        //
        System.out.println();
        System.out.print("  ");
        for(int b = 0;b < this.s;b++)
        {
            System.out.print("-----");
        }
        //
        System.out.println();
    }    
    public boolean check_existance_x(int x)
    {
        boolean r = false;
        if((x < this.s)&&(x >= 0))
        {
            r = true;
         }
        return r;
    }
    public boolean check_existance_y(int y)
    {
        boolean r = false;
        if((y < this.s)&&(y >= 0))
        {
            r = true;
         }
        return r;
    }
    public int random_direction()
    {
        int d = (int)(10*Math.random())%4;
        return d;
     }
     public int[] get_position()
    {
        int[] arr = new int[2];
        for(int i = 0 ; i <= (this.s-1) ; i++)
        {
            for(int j = 0 ; j <= (this.s-1) ; j++ )
            {
                if(board[i][j].equals("  "))
                {
                    arr[0] = i;
                    arr[1] = j;
                }
             }
         }
        return arr;
     }
     public boolean d_check(int d)
    {
        boolean a = true;
        int[] p = new int[2];
        p = get_position();
        if(d == 0)
        {
            a = check_existance_y(p[0]-1);
         }
         if(d == 2)
        {
            a = check_existance_y(p[0]+1);
         }
         if(d == 1)
        {
            a = check_existance_x(p[1]+1);
         }
         if(d == 3)
        {
            a = check_existance_x(p[1]-1);
         }
        return a;
     }
     public int[] generate_position(int d)
    {
        int[] n = new int[2];
        n = get_position();
        if(d == 0)
        {
            n[0]--;
         }
        if(d == 1)
        {
            n[1]++;
         }
        if(d == 2)
        {
            n[0]++;
         }
        if(d == 3)
        {
            n[1]--;
         }
        return n;
     }
     public void cls()
    {
        System.out.println('\u000C');
    }
    public void m_switch(int x_in,int y_in,int x_fn,int y_fn)
    {
        String temp = this.board[y_fn][x_fn];
        this.board[y_fn][x_fn] = this.board[y_in][x_in];
        this.board[y_in][x_in] = temp;
    }
    public void move(int d)
    {
        int[] pos = new int[2];
        int[] npos = new int[2];
        npos = generate_position(d);
        pos = get_position(); 
        m_switch(pos[1],pos[0],npos[1],npos[0]);
     }
    public void end()
    {
        cls();
        System.out.println("you won!!!");
    }
    public boolean check_end()
    {
        boolean r = true;
        int fill = 0;
        for(int i = 0 ; i < this.s ; i++)
        {
            for(int j = 0 ; j < this.s ; j++ )
            {
                fill = ((this.s*(i))+(j+1));
                if(fill != this.s*this.s)
                {
                    if(fill >= 10)
                    {
                        if(!board[i][j].equals(""+fill))
                        {
                            r = false;
                        }           
                    }
                    else if(fill < 10)
                    {
                        if(!board[i][j].equals("0"+fill))
                        {
                            r = false;
                        }
                    }
                }        
             }
         }      
        return r;
    }
    public void scramble()
    {
        int d;
        for(int i = 1 ; i <= 10000 ; i++)
        {
            do
            {
                 d = random_direction();
            }
            while(!d_check(d));
            move(d);
        }
    }
    public char input()
    {
        String in = new String(new Scanner(System.in).next());
        char c = ' ';
        if(!in.equals(""))
        {
            c = in.charAt(0);
        }
        return c;
    }
    public int get_d(char i)
    {
        int r = 42;
        if(i == '8')
        {
            r = 2;
        }
        if(i == '6')
        {
            r = 3;
        }
        if(i == '5')
        {
            r = 0;
        }
        if(i == '4')
        {
            r = 1;
        }
        return r;
    }
    public boolean check_q(char in)
    {
        boolean r = false;
        if(in == 'q')
        {
            r = true;
        }
        return r;
    }
    public void time_delay()
    {
        for(int i = 1 ; i <= 1 ; i++)
        {
            for(int j = 1 ; j <= 1000000 ; j++)
            {
                for(int k = 1 ; k <= 1000 ; k++)
                {
                }
            }
         }
     }
    public static void main()
    {
        Puzzle_15 p = new Puzzle_15();
        int d;
        char c;
        p.set_board();
        p.scramble();
        while(!p.check_end())
        {
            p.print();
            c = p.input();
            if(p.check_q(c))
            {
                break;
            }
            d = p.get_d(c);
            if(p.d_check(d))
            {              
                 p.move(d);
            }                      
        }
        if(p.check_end())
        {
            p.print();
            p.time_delay();
            p.time_delay();
            p.end();
        }
        else
        {
            p.cls();
        }
    }
}