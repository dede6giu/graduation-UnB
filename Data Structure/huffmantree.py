class NodeLetter:
    def __init__(self, c, f):
        self.char: str = c
        self.freq: int = f

    def __int__(self):
        return self.freq
    
    def __str__(self):
        return self.char

class NodeFreq:
    def __init__(self, left=None, right=None):
        self.l: NodeFreq | NodeLetter = left
        self.r: NodeFreq | NodeLetter = right
        self.freq: int = self._fixfreq()
        return
    
    def _fixfreq(self):
        aux: int = 0
        aux += int(self.l)
        aux += int(self.r)
        self.freq = aux

    def __int__(self):
        return self.freq
    
    def get_freq(self):
        return self.freq
    
    def get_left(self):
        return self.l
    
    def get_right(self):
        return self.r
    
    def add_node(self, node: NodeLetter):
        if int(node) < self.freq:
            if self.l == None:
                self.l = node
                return
            if isinstance(node, NodeFreq):
                return self.l.add_node(node)
            if self.l.freq < node.freq:
                aux = NodeFreq(self.l, node.freq)
                self.l = aux
                return
            else:
                aux = NodeFreq(node.freq, self.l)
                self.l = aux

        else:
            if self.r == None:
                self.r = node
                return
            if isinstance(node, NodeFreq):
                return self.r.add_node(node)
