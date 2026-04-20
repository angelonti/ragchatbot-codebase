import js from '@eslint/js';

export default [
    js.configs.recommended,
    {
        languageOptions: {
            ecmaVersion: 2022,
            sourceType: 'script',
            globals: {
                document: 'readonly',
                window: 'readonly',
                localStorage: 'readonly',
                fetch: 'readonly',
                console: 'readonly',
                Date: 'readonly',
                marked: 'readonly',
            },
        },
        rules: {
            'no-console': 'warn',
            'no-unused-vars': 'warn',
            eqeqeq: 'error',
        },
    },
];