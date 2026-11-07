import std.stdio;
import std.string;
import std.algorithm;
import std.conv;

void main(string[] args)
{
    if(args.length < 2)
    {
        writeln("Правильное использование: rutoen <текст>");
        return;
    }

    string input = args[1 .. $].join(" ");

    dchar[] en_low = "qwertyuiop[]asdfghjkl;'zxcvbnm,./".to!(dchar[]);
    dchar[] ru_low = "йцукенгшщзхъфывапролджэячсмитьбю.".to!(dchar[]);

    dchar[] en_up = "QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>?".to!(dchar[]);
    dchar[] ru_up = "ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ,".to!(dchar[]);

    dchar[] result;

    bool isRussian = input.any!(c => c >= 'а' && c <= 'я' || c == 'ё' || c >= 'А' && c <= 'Я' || c == 'Ё');

    foreach(dchar c; input)
    {
        long index = -1;

        if (isRussian) {
            index = ru_low.indexOf(c);
            if (index != -1) { result ~= en_low[index]; continue; }

            index = ru_up.indexOf(c);
            if (index != -1) { result ~= en_up[index]; continue; }
        } else {
            index = en_low.indexOf(c);
            if (index != -1) { result ~= ru_low[index]; continue; }

            index = en_up.indexOf(c);
            if (index != -1) { result ~= ru_up[index]; continue; }
        }

        result ~= c;
    }

    writeln(result.to!(string));
}