import std.stdio;
import std.string;

void main(string[] args)
{
    if(args.length < 2)
    {
        writeln("Правильное использование: rutoen <текст>");
        writeln("Пример: rutoen ghbdtn");
        return;
    }

    string input = args[1 .. $].join(" ");

    string en = "qwertyuiop[]asdfghjkl;'zxcvbnm,./.";
    string ru = "йцукенгшщзхъфывапролджэячсмитьбю.,";

    char[] result;

    foreach(char c; input)
    {
        auto index = ru.indexOf(c);

        if(index != -1)
        {
            result ~= en[index];
        }
        else
        {
            result ~= c;
        }
    }
    writeln(result);
}