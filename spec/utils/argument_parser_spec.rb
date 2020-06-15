RSpec.describe Slidr do
    describe Slidr::Utils::ArgumentParser, '#path' do
        context 'when key as :is used' do
            it "returns path" do
                path = 'path/to/somewhere'
                expect(Slidr::Utils::ArgumentParser.path(is: path)).to equal(path)
            end
        end

        context 'when key as :path used' do
            it "the given path" 
        end
        context 'when path passed as string' do
            it "the given path"
        end

        context 'when not one of the specified keys passed' do
            it 'raises ArgumentError' do
                expect { Slidr::Utils::ArgumentParser.path(something: 'else') }.to raise_error(ArgumentError)
            end
        end
    end
end