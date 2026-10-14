namespace epg123_gui.ViewModels
{
    public sealed class LineupsViewModel : ViewModelBase
    {
        private bool _cancelOperation = true;

        public bool CancelOperation
        {
            get => _cancelOperation;
            set => SetProperty(ref _cancelOperation, value);
        }
    }
}
