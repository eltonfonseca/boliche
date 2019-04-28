# Classe responsável pela ciração dos placares
# @author Felipe Hercules
class Placar

    # Frames
    # @return [Array<Frames>] Frames utilizados pelo placar
    attr_reader :frames

    # Construtor
    def initialize(frames)
        @frames = frames
    end

end