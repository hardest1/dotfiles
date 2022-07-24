"use strict";
// See https://hyper.is#cfg for all currently supported options.
module.exports = {
    config: {
        updateChannel: 'stable',
        fontSize: 14,
        fontFamily: '"Roboto Mono", "DejaVu Sans Mono", "Lucida Console", "Comic Mono", Menlo, Consolas, monospace',
        fontWeight: 'normal',
        fontWeightBold: 'bold',
        lineHeight: 1,
        letterSpacing: 0,
        cursorColor: 'rgba(248,28,229,0.8)', // cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
        cursorAccentColor: '#000', // text color under BLOCK cursor
        cursorShape: 'BLOCK', // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
        cursorBlink: true, // blinking cursor
        foregroundColor: '#fff', // color of the text
        backgroundColor: '#000', // background color
        selectionColor: 'rgba(248,28,229,0.3)', // terminal selection color
        borderColor: '#333', // border color (window, tabs)
        css: '', // custom CSS to embed in the main window
        termCSS: '', // custom CSS to embed in the terminal window
        workingDirectory: '', // set custom startup directory (must be an absolute path)
        showHamburgerMenu: '',
        showWindowControls: '',
        padding: '12px 14px',
        colors: {
            black: '#000000',
            red: '#C51E14',
            green: '#1DC121',
            yellow: '#C7C329',
            blue: '#0A2FC4',
            magenta: '#C839C5',
            cyan: '#20C5C6',
            white: '#C7C7C7',
            lightBlack: '#686868',
            lightRed: '#FD6F6B',
            lightGreen: '#67F86F',
            lightYellow: '#FFFA72',
            lightBlue: '#6A76FB',
            lightMagenta: '#FD7CFC',
            lightCyan: '#68FDFE',
            lightWhite: '#FFFFFF',
            limeGreen: '#32CD32',
            lightCoral: '#F08080',
        },
        shell: 'C:\\Program Files\\Git\\bin\\bash.exe',
        shellArgs: ['--login'],
        env: { TERM: 'cygwin'},
        bell: 'SOUND', // 'SOUND' or false
        // bellSoundURL: '/path/to/sound/file',
        copyOnSelect: true,
        defaultSSHApp: true,
        quickEdit: false, // true: disables context menu and enables paste on right click instead
        macOptionSelectionMode: 'vertical',
        webGLRenderer: true,
        webLinksActivationKey: 'ctrl', // keypress for link activation: [ctrl|alt|meta|shift]
        disableLigatures: true, // disable ligatures provided by some fonts
        disableAutoUpdates: false, // disable auto updates
        screenReaderMode: false, // enable screen reading apps to read the terminal
        preserveCWD: true, // preserve working directory when creating splits or tabs
        
        // hyper-opacity plugin
        opacity: {
            focus: 0.99,
            blur: 0.95
        }
    },
    // key mappings
    keymaps: {
        // 'window:devtools': 'cmd+alt+o',
    },
    // plugins - format: [@org/]project[#version]
    plugins: [
        "hyper-opacity"
    ],
    // local/dev plugins
    localPlugins: [],
};
//# sourceMappingURL=config-default.js.map