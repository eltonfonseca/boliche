# Classe responsável pela ciração dos placares
# @author Gean Matos
class Placar

    # Frames
    # @return [Array<Frames>] Frames utilizados pelo placar
    attr_reader :frames

    # Construtor
    def initialize
        @frames = Array.new(11)
    end
end
