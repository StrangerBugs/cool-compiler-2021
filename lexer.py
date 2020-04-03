from cmp.automata import State
from cmp.parsing import Lexer
from cmp.regex import NFA


class CoolLexer(Lexer):
    def __init__(self, G):
        self.G = G
        self.eof = G.EOF
        self.regexs = self._build_regexs(self.__table())
        self.automaton = self._build_automaton()

    def __table(self):
        G = self.G
        return [
            (G["+"], NFA(2, [1], {(0, "+"): [1], }, start=0)),
            (G["-"], NFA(2, [0], {(1, "-"): [0], }, start=1)),
            (G["*"], NFA(2, [1], {(0, "*"): [1], }, start=0)),
            (G["/"], NFA(2, [1], {(0, "/"): [1], }, start=0)),
            (G["<="], NFA(3, [0], {(2, "<"): [1], (1, "="): [0], }, start=2)),
            (G["<"], NFA(2, [0], {(1, "<"): [0], }, start=1)),
            (G["="], NFA(2, [1], {(0, "="): [1], }, start=0)),
            (G["~"], NFA(2, [0], {(1, "~"): [0], }, start=1)),
            (G["not"], NFA(4, [3], {(2, "n"): [1], (1, "o"): [0], (0, "t"): [3], }, start=2)),
            (G["{"], NFA(2, [1], {(0, "{"): [1], }, start=0)),
            (G["}"], NFA(2, [0], {(1, "}"): [0], }, start=1)),
            (G["("], NFA(2, [1], {(0, "("): [1], }, start=0)),
            (G[")"], NFA(2, [1], {(0, ")"): [1], }, start=0)),
            (G[","], NFA(2, [1], {(0, ","): [1], }, start=0)),
            (G["."], NFA(2, [1], {(0, "."): [1], }, start=0)),
            (G["@"], NFA(2, [1], {(0, "@"): [1], }, start=0)),
            (G[":"], NFA(2, [0], {(1, ":"): [0], }, start=1)),
            (G[";"], NFA(2, [1], {(0, ";"): [1], }, start=0)),
            (G["<-"], NFA(3, [1], {(2, "<"): [0], (0, "-"): [1], }, start=2)),
            (G["=>"], NFA(3, [0], {(1, "="): [2], (2, ">"): [0], }, start=1)),
            (G["class"], NFA(6, [0], {(3, "c"): [2], (2, "l"): [1], (1, "a"): [4], (4, "s"): [5], (5, "s"): [0], }, start=3)),
            (G["inherits"], NFA(9, [7], {(4, "i"): [2], (2, "n"): [3], (3, "h"): [5], (5, "e"): [0], (0, "r"): [8], (8, "i"): [1], (1, "t"): [6], (6, "s"): [7], }, start=4)),
            (G["if"], NFA(3, [2], {(0, "i"): [1], (1, "f"): [2], }, start=0)),
            (G["then"], NFA(5, [1], {(2, "t"): [3], (3, "h"): [4], (4, "e"): [0], (0, "n"): [1], }, start=2)),
            (G["else"], NFA(5, [4], {(0, "e"): [1], (1, "l"): [2], (2, "s"): [3], (3, "e"): [4], }, start=0)),
            (G["fi"], NFA(3, [1], {(0, "f"): [2], (2, "i"): [1], }, start=0)),
            (G["while"], NFA(6, [5], {(0, "w"): [1], (1, "h"): [2], (2, "i"): [3], (3, "l"): [4], (4, "e"): [5], }, start=0)),
            (G["loop"], NFA(5, [1], {(2, "l"): [3], (3, "o"): [4], (4, "o"): [0], (0, "p"): [1], }, start=2)),
            (G["pool"], NFA(5, [1], {(4, "p"): [3], (3, "o"): [0], (0, "o"): [2], (2, "l"): [1], }, start=4)),
            (G["let"], NFA(4, [1], {(2, "l"): [0], (0, "e"): [3], (3, "t"): [1], }, start=2)),
            (G["in"], NFA(3, [1], {(2, "i"): [0], (0, "n"): [1], }, start=2)),
            (G["case"], NFA(5, [4], {(0, "c"): [1], (1, "a"): [2], (2, "s"): [3], (3, "e"): [4], }, start=0)),
            (G["esac"], NFA(5, [1], {(3, "e"): [4], (4, "s"): [2], (2, "a"): [0], (0, "c"): [1], }, start=3)),
            (G["of"], NFA(3, [1], {(2, "o"): [0], (0, "f"): [1], }, start=2)),
            (G["new"], NFA(4, [3], {(0, "n"): [1], (1, "e"): [2], (2, "w"): [3], }, start=0)),
            (G["isvoid"], NFA(7, [2], {(0, "i"): [4], (4, "s"): [6], (6, "v"): [5], (5, "o"): [3], (3, "i"): [1], (1, "d"): [2], }, start=0)),
            (G["true"], NFA(5, [4], {(0, "t"): [1], (1, "r"): [2], (2, "u"): [3], (3, "e"): [4], }, start=0)),
            (G["false"], NFA(6, [3], {(4, "f"): [0], (0, "a"): [2], (2, "l"): [1], (1, "s"): [5], (5, "e"): [3], }, start=4)),
            (G["end"], NFA(4, [0], {(3, "e"): [1], (1, "n"): [2], (2, "d"): [0], }, start=3)),
            (G["space"], NFA(2, [0], {(1, " "): [0], (0, " "): [0], }, start=1)),
            (G["newline"], NFA(2, [0], {(1, "\n"): [0], (0, "\n"): [0], }, start=1)),
            (G["integer"], NFA(4, [2], {(1, "1"): [3], (1, "5"): [3], (1, "8"): [3], (1, "7"): [3], (1, "6"): [3], (1, "2"): [3], (1, "3"): [3], (1, "9"): [3], (1, "-"): [0], (1, "4"): [3], (3, "1"): [2], (3, "5"): [2], (3, "8"): [2], (3, "7"): [2], (3, "6"): [2], (3, "2"): [2], (3, "3"): [2], (3, "9"): [2], (3, "4"): [2], (3, "0"): [2], (2, "1"): [2], (2, "5"): [2], (2, "8"): [2], (2, "7"): [2], (2, "6"): [2], (2, "2"): [2], (2, "3"): [2], (2, "9"): [2], (2, "4"): [2], (2, "0"): [2], (0, "1"): [3], (0, "5"): [3], (0, "8"): [3], (0, "7"): [3], (0, "6"): [3], (0, "2"): [3], (0, "3"): [3], (0, "9"): [3], (0, "4"): [3], }, start=1)),
            (G["type"], NFA(2, [1], {(0, "E"): [1], (0, "D"): [1], (0, "M"): [1], (0, "B"): [1], (0, "I"): [1], (0, "X"): [1], (0, "G"): [1], (0, "W"): [1], (0, "T"): [1], (0, "O"): [1], (0, "C"): [1], (0, "L"): [1], (0, "R"): [1], (0, "A"): [1], (0, "N"): [1], (0, "F"): [1], (0, "J"): [1], (0, "Q"): [1], (0, "S"): [1], (0, "U"): [1], (0, "Y"): [1], (0, "Z"): [1], (0, "V"): [1], (0, "K"): [1], (0, "P"): [1], (0, "H"): [1], (1, "E"): [1], (1, "o"): [1], (1, "y"): [1], (1, "7"): [1], (1, "z"): [1], (1, "D"): [1], (1, "w"): [1], (1, "c"): [1], (1, "M"): [1], (1, "g"): [1], (1, "d"): [1], (1, "u"): [1], (1, "B"): [1], (1, "I"): [1], (1, "e"): [1], (1, "2"): [1], (1, "X"): [1], (1, "k"): [1], (1, "n"): [1], (1, "G"): [1], (1, "p"): [1], (1, "W"): [1], (1, "q"): [1], (1, "8"): [1], (1, "T"): [1], (1, "O"): [1], (1, "C"): [1], (1, "L"): [1], (1, "f"): [1], (1, "i"): [1], (1, "r"): [1], (1, "R"): [1], (1, "A"): [1], (1, "6"): [1], (1, "N"): [1], (1, "s"): [1], (1, "3"): [1], (1, "F"): [1], (1, "m"): [1], (1, "a"): [1], (1, "J"): [1], (1, "9"): [1], (1, "Q"): [1], (1, "S"): [1], (1, "4"): [1], (1, "U"): [1], (1, "h"): [1], (1, "Y"): [1], (1, "l"): [1], (1, "0"): [1], (1, "j"): [1], (1, "1"): [1], (1, "Z"): [1], (1, "5"): [1], (1, "t"): [1], (1, "V"): [1], (1, "K"): [1], (1, "P"): [1], (1, "x"): [1], (1, "b"): [1], (1, "H"): [1], (1, "v"): [1], }, start=0)),
            (G["id"], NFA(2, [1], {(0, "o"): [1], (0, "y"): [1], (0, "z"): [1], (0, "w"): [1], (0, "c"): [1], (0, "g"): [1], (0, "d"): [1], (0, "u"): [1], (0, "e"): [1], (0, "k"): [1], (0, "n"): [1], (0, "p"): [1], (0, "q"): [1], (0, "f"): [1], (0, "i"): [1], (0, "s"): [1], (0, "m"): [1], (0, "a"): [1], (0, "h"): [1], (0, "l"): [1], (0, "j"): [1], (0, "t"): [1], (0, "x"): [1], (0, "b"): [1], (0, "r"): [1], (0, "v"): [1], (1, "E"): [1], (1, "o"): [1], (1, "y"): [1], (1, "7"): [1], (1, "z"): [1], (1, "D"): [1], (1, "w"): [1], (1, "c"): [1], (1, "M"): [1], (1, "g"): [1], (1, "d"): [1], (1, "u"): [1], (1, "B"): [1], (1, "I"): [1], (1, "e"): [1], (1, "2"): [1], (1, "X"): [1], (1, "k"): [1], (1, "n"): [1], (1, "p"): [1], (1, "G"): [1], (1, "W"): [1], (1, "q"): [1], (1, "8"): [1], (1, "T"): [1], (1, "f"): [1], (1, "C"): [1], (1, "i"): [1], (1, "L"): [1], (1, "O"): [1], (1, "R"): [1], (1, "A"): [1], (1, "6"): [1], (1, "N"): [1], (1, "s"): [1], (1, "3"): [1], (1, "F"): [1], (1, "m"): [1], (1, "a"): [1], (1, "J"): [1], (1, "9"): [1], (1, "Q"): [1], (1, "S"): [1], (1, "4"): [1], (1, "h"): [1], (1, "l"): [1], (1, "U"): [1], (1, "Y"): [1], (1, "0"): [1], (1, "H"): [1], (1, "j"): [1], (1, "1"): [1], (1, "Z"): [1], (1, "5"): [1], (1, "t"): [1], (1, "V"): [1], (1, "K"): [1], (1, "P"): [1], (1, "x"): [1], (1, "b"): [1], (1, "r"): [1], (1, "v"): [1], }, start=0)),
            (G["string"], NFA(3, [1], {(0, "\""): [2], (2, ">"): [2], (2, "D"): [2], (2, "*"): [2], (2, "g"): [2], (2, "@"): [2], (2, "q"): [2], (2, "O"): [2], (2, "L"): [2], (2, "3"): [2], (2, "F"): [2], (2, "="): [2], (2, "Q"): [2], (2, "#"): [2], (2, "("): [2], (2, ","): [2], (2, "Z"): [2], (2, "t"): [2], (2, "V"): [2], (2, "]"): [2], (2, "{"): [2], (2, "~"): [2], (2, "r"): [2], (2, "E"): [2], (2, "z"): [2], (2, "-"): [2], (2, "I"): [2], (2, "2"): [2], (2, "k"): [2], (2, "G"): [2], (2, "&"): [2], (2, "6"): [2], (2, "N"): [2], (2, "+"): [2], (2, "\""): [1], (2, " "): [2], (2, "l"): [2], (2, "Y"): [2], (2, "}"): [2], (2, "j"): [2], (2, "?"): [2], (2, "|"): [2], (2, "."): [2], (2, "`"): [2], (2, "'"): [2], (2, "v"): [2], (2, "y"): [2], (2, ":"): [2], (2, "w"): [2], (2, "M"): [2], (2, "!"): [2], (2, "B"): [2], (2, "n"): [2], (2, "p"): [2], (2, "W"): [2], (2, "8"): [2], (2, "T"): [2], (2, "$"): [2], (2, "C"): [2], (2, "_"): [2], (2, "9"): [2], (2, "<"): [2], (2, "s"): [2], (2, "a"): [2], (2, "J"): [2], (2, "4"): [2], (2, "S"): [2], (2, "5"): [2], (2, "P"): [2], (2, "/"): [2], (2, "x"): [2], (2, "\\"): [2], (2, "d"): [2], (2, "o"): [2], (2, "7"): [2], (2, "c"): [2], (2, "%"): [2], (2, "u"): [2], (2, "e"): [2], (2, "X"): [2], (2, ";"): [2], (2, ")"): [2], (2, "["): [2], (2, "f"): [2], (2, "i"): [2], (2, "R"): [2], (2, "A"): [2], (2, "m"): [2], (2, "U"): [2], (2, "h"): [2], (2, "^"): [2], (2, "0"): [2], (2, "1"): [2], (2, "K"): [2], (2, "b"): [2], (2, "H"): [2], (1, ">"): [2], (1, "D"): [2], (1, "*"): [2], (1, "g"): [2], (1, "@"): [2], (1, "q"): [2], (1, "O"): [2], (1, "L"): [2], (1, "3"): [2], (1, "F"): [2], (1, "="): [2], (1, "Q"): [2], (1, "#"): [2], (1, "("): [2], (1, ","): [2], (1, "Z"): [2], (1, "t"): [2], (1, "V"): [2], (1, "]"): [2], (1, "{"): [2], (1, "~"): [2], (1, "r"): [2], (1, "E"): [2], (1, "z"): [2], (1, "-"): [2], (1, "I"): [2], (1, "2"): [2], (1, "k"): [2], (1, "G"): [2], (1, "&"): [2], (1, "6"): [2], (1, "N"): [2], (1, "+"): [2], (1, "\""): [1], (1, " "): [2], (1, "l"): [2], (1, "Y"): [2], (1, "}"): [2], (1, "j"): [2], (1, "?"): [2], (1, "|"): [2], (1, "."): [2], (1, "`"): [2], (1, "'"): [2], (1, "v"): [2], (1, "y"): [2], (1, ":"): [2], (1, "w"): [2], (1, "M"): [2], (1, "!"): [2], (1, "B"): [2], (1, "n"): [2], (1, "p"): [2], (1, "W"): [2], (1, "8"): [2], (1, "T"): [2], (1, "$"): [2], (1, "C"): [2], (1, "_"): [2], (1, "9"): [2], (1, "<"): [2], (1, "s"): [2], (1, "a"): [2], (1, "J"): [2], (1, "4"): [2], (1, "S"): [2], (1, "5"): [2], (1, "P"): [2], (1, "/"): [2], (1, "x"): [2], (1, "\\"): [2], (1, "d"): [2], (1, "o"): [2], (1, "7"): [2], (1, "c"): [2], (1, "%"): [2], (1, "u"): [2], (1, "e"): [2], (1, "X"): [2], (1, ";"): [2], (1, ")"): [2], (1, "["): [2], (1, "f"): [2], (1, "i"): [2], (1, "R"): [2], (1, "A"): [2], (1, "m"): [2], (1, "U"): [2], (1, "h"): [2], (1, "^"): [2], (1, "0"): [2], (1, "1"): [2], (1, "K"): [2], (1, "b"): [2], (1, "H"): [2], }, start=0)),
        ]

    def _build_regexs(self, table):
        regexs = []
        for n, (token_type, nfa) in enumerate(self.__table()):
            automaton, states = State.from_nfa(nfa, get_states=True)

            for state in states:
                if state.final:
                    state.tag = (n, token_type)

            regexs.append(automaton)

        return regexs
