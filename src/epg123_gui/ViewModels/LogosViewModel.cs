namespace epg123_gui.ViewModels
{
    public sealed class LogosViewModel : ViewModelBase
    {
        private string _stationSummary;
        private bool _logoChanged;

        public string StationSummary
        {
            get => _stationSummary;
            set => SetProperty(ref _stationSummary, value);
        }

        public bool LogoChanged
        {
            get => _logoChanged;
            set => SetProperty(ref _logoChanged, value);
        }
    }
}
