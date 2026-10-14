namespace epg123_gui.ViewModels
{
    public sealed class ConfigFormViewModel : ViewModelBase
    {
        private string _baseApiUrl;
        private string _baseArtworkUrl;
        private bool _useDebug;

        public string BaseApiUrl
        {
            get => _baseApiUrl;
            set => SetProperty(ref _baseApiUrl, value);
        }

        public string BaseArtworkUrl
        {
            get => _baseArtworkUrl;
            set => SetProperty(ref _baseArtworkUrl, value);
        }

        public bool UseDebug
        {
            get => _useDebug;
            set => SetProperty(ref _useDebug, value);
        }
    }
}
