import java.util.Scanner;
class Slide_2048
{
    private int[][] grid;
    private int power;
    //
    private int score;
    int get_score()
    {
        return this.score;
    }
    //
    Slide_2048()
    {
        this.grid = new int[4][4];
        this.power = 11;
        this.score = 0;
    }
    Slide_2048(int p,int s)
    {
        this.grid = new int[s][s];
        this.power = p;
        this.score = 0;
    }
    //
    void random_2()
    {
        if(!check_full())
        {
            int i,j;
            do
            {  
                i = ((int)(Math.random()*1000))%this.grid.length;
                j = ((int)(Math.random()*1000))%this.grid[0].length;
            }
            while(this.grid[i][j] != 0);
            //
            this.grid[i][j] = 2;
        }
    }
    //
    boolean can_up()
    {
        boolean c = false;
        //
        for(int i = 1 ; i < this.grid.length ; i++)
        {
            for(int j = 0 ; j < this.grid[i].length ; j++)
            {
                if((this.grid[i][j] != 0)&&((this.grid[i-1][j] == 0)||(this.grid[i-1][j] == this.grid[i][j])))
                {
                    c = true;
                    break;
                }
            }
        }
        //
        return c;
    }
    boolean can_down()
    {
        boolean c = false;
        //
        for(int i = 0 ; i < this.grid.length-1 ; i++)
        {
            for(int j = 0 ; j < this.grid[i].length ; j++)
            {
                if((this.grid[i][j] != 0)&&((this.grid[i+1][j] == 0)||(this.grid[i+1][j] == this.grid[i][j])))
                {
                    c = true;
                    break;
                }
            }
        }
        //
        return c;
    }
    boolean can_left()
    {
        boolean c = false;
        //
        for(int i = 0 ; i < this.grid.length ; i++)
        {
            for(int j = 1 ; j < this.grid[i].length ; j++)
            {
                if((this.grid[i][j] != 0)&&((this.grid[i][j-1] == 0)||(this.grid[i][j-1] == this.grid[i][j])))
                {
                    c = true;
                    break;
                }
            }
        }
        //
        return c;
    }
    boolean can_right()
    {
        boolean c = false;
        //
        for(int i = 0 ; i < this.grid.length ; i++)
        {
            for(int j = 0 ; j < this.grid[i].length-1 ; j++)
            {
                if((this.grid[i][j] != 0)&&((this.grid[i][j+1] == 0)||(this.grid[i][j+1] == this.grid[i][j])))
                {
                    c = true;
                    break;
                }
            }
        }
        //
        return c;
    }
    //
    void up()
    {
        for(int j = 0 ; j < this.grid[0].length ; j++)
        {
            for(int i = 0 ; i < this.grid.length ; i++)
            {
                if(this.grid[i][j] != 0)
                {
                    for(int c = i ; c > 0 ; c--)
                    {
                        if(this.grid[c-1][j] == 0)
                        {
                            this.grid[c-1][j] = this.grid[c][j];
                            this.grid[c][j] = 0;
                        }
                        else if(this.grid[c-1][j] == this.grid[c][j])
                        {
                            this.grid[c-1][j] += this.grid[c][j];
                            this.grid[c][j] = 0;
                            this.score += this.grid[c-1][j];
                            break;
                        }
                        else
                        {
                            break;
                        }
                    }
                }
            }
        }
    }
    void down()
    {
        for(int j = 0 ; j < this.grid[0].length ; j++)
        {
            for(int i = this.grid.length-1 ; i >= 0 ; i--)
            {
                if(this.grid[i][j] != 0)
                {
                    for(int c = i ; c < this.grid.length-1 ; c++)
                    {
                        if(this.grid[c+1][j] == 0)
                        {
                            this.grid[c+1][j] = this.grid[c][j];
                            this.grid[c][j] = 0;
                        }
                        else if(this.grid[c+1][j] == this.grid[c][j])
                        {
                            this.grid[c+1][j] += this.grid[c][j];
                            this.grid[c][j] = 0;
                            this.score += this.grid[c+1][j];
                            break;
                        }
                        else
                        {
                            break;
                        }
                    }
                }
            }
        }
    }
    void left()
    {
        for(int i = 0 ; i < this.grid.length ; i++)
        {
            for(int j = 0 ; j < this.grid[i].length ; j++)
            {
                if(this.grid[i][j] != 0)
                {
                    for(int c = j ; c > 0 ; c--)
                    {
                        if(this.grid[i][c-1] == 0)
                        {
                            this.grid[i][c-1] = this.grid[i][c];
                            this.grid[i][c] = 0;
                        }
                        else if(this.grid[i][c-1] == this.grid[i][c])
                        {
                            this.grid[i][c-1] += this.grid[i][c];
                            this.grid[i][c] = 0;
                            this.score += this.grid[i][c-1];
                            break;
                        }
                        else
                        {
                            break;
                        }
                    }
                }
            }
        }
    }
    void right()
    {
        for(int i = 0 ; i < this.grid.length ; i++)
        {
            for(int j = this.grid[i].length-1 ; j >= 0 ; j--)
            {
                if(this.grid[i][j] != 0)
                {
                    for(int c = j ; c < this.grid[i].length-1 ; c++)
                    {
                        if(this.grid[i][c+1] == 0)
                        {
                            this.grid[i][c+1] = this.grid[i][c];
                            this.grid[i][c] = 0;
                        }
                        else if(this.grid[i][c+1] == this.grid[i][c])
                        {
                            this.grid[i][c+1] += this.grid[i][c];
                            this.grid[i][c] = 0;
                            this.score += this.grid[i][c+1];
                            break;
                        }
                        else
                        {
                            break;
                        }
                    }
                }
            }
        }
    }
    //
    private int max()
    {
        int max = 0;
        //
        for(int i = 0 ; i < this.grid.length ; i++)
        {
            for(int j = 0 ; j < this.grid[i].length ; j++)
            {
                if(max < this.grid[i][j])
                {
                    max = this.grid[i][j];
                }
            }
        }
        //
        return max;
    }
    //
    void print()
    {
        System.out.print('\f');
        System.out.println("---------------------------------");
        System.out.println("score: "+this.score);
        System.out.println("---------------------------------");
        //
        String[][] grid = new String[this.grid.length][this.grid[0].length];
        //
        for(int i = 0 ; i < grid.length ; i++)
        {
            for(int j = 0 ; j < grid[i].length ; j++)
            {
                grid[i][j] = ""+this.grid[i][j];
                for(int a = grid[i][j].length() ; a <= (""+max()).length() ; a ++)
                {
                    grid[i][j] += " ";
                }
            }
        }
        //
        for(int i = 0 ; i < grid.length ; i++)
        {
            for(int j = 0 ; j < grid[i].length ; j++)
            {
                System.out.print(grid[i][j]);
            }
            System.out.println();
        }
        //
        System.out.println("---------------------------------");
    }
    //
    boolean check_end_w()
    {
        if(max() == Math.pow(2,this.power))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    private boolean check_full()
    {
        boolean c = true;
        for(int i = 0 ; i < this.grid.length ; i++)
        {
            for(int j = 0 ; j < this.grid[i].length ; j++)
            {
                if(this.grid[i][j] == 0)
                {
                    c = false;
                }
            }
        }
        return c;
    }
    boolean check_end_l()
    {
        if(check_full())
        {
            return !(can_up()||can_down()||can_left()||can_right());
        }
        else
        {
            return false;
        }
    }
    //
    //
    public static void main(int power,int side)
    {
        Slide_2048 s = new Slide_2048(power,side);
        Scanner sc = new Scanner(System.in);
        s.random_2();
        //
        do
        {
            s.print();
            //
            char inp = sc.next().charAt(0);
            //
            if(inp == '8')
            {
                if(s.can_up())
                {
                    s.up();
                    s.random_2();
                }
            }
            else if(inp == '5')
            {
                if(s.can_down())
                {
                    s.down();
                    s.random_2();
                }
            }
            else if(inp == '4')
            {
                if(s.can_left())
                {
                    s.left();
                    s.random_2();
                }
            }
            else if(inp == '6')
            {
                if(s.can_right())
                {
                    s.right();
                    s.random_2();
                }
            }
            else if(inp == 'q')
            {
                break;
            }
            //
            if(s.check_end_w())
            {
                break;
            }
        }
        while(!s.check_end_l());
        //
        if(s.check_end_w())
        {
            s.print();
            System.out.println("YOU WIN!!");
        }
        else
        {
            System.out.print('\f');
            System.out.println("Game Over");
        }
        System.out.println("-------------------");
        System.out.println("score: "+s.get_score());
    }
}