$files = Get-ChildItem -Path "c:\Dev\portfolio\portfolio\projects" -Filter "*.html"

$scriptTag = @"
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: {
              sky: {
                50: '#f4f8fb', 100: '#e5f0f6', 200: '#c5dcee', 300: '#a3c7e4',
                400: '#a3c7e4', 500: '#93B9DD', 600: '#7599be', 700: '#5a789a',
                800: '#455973', 900: '#354355',
              },
              blue: {
                50: '#f4f8fb', 100: '#e5f0f6', 200: '#c5dcee', 300: '#a3c7e4',
                400: '#a3c7e4', 500: '#93B9DD', 600: '#7599be', 700: '#5a789a',
                800: '#455973', 900: '#354355',
              }
            }
          }
        }
      }
    </script>
</head>
"@

foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    
    if ($content -notmatch "tailwind.config =") {
        $content = $content -replace '</head>', $scriptTag
    }
    
    $content = $content -replace 'bg-slate-950', 'bg-slate-50'
    $content = $content -replace 'text-slate-200', 'text-slate-700'
    $content = $content -replace 'text-white', 'text-slate-900'
    $content = $content -replace 'text-slate-300', 'text-slate-600'
    $content = $content -replace 'text-slate-400', 'text-slate-600'
    
    $content = $content -replace 'bg-slate-900/50', 'bg-white'
    $content = $content -replace 'bg-slate-900/60', 'bg-white'
    $content = $content -replace 'bg-slate-900', 'bg-white'
    $content = $content -replace 'bg-slate-800', 'bg-slate-100'
    
    $content = $content -replace 'border-slate-800/80', 'border-slate-200'
    $content = $content -replace 'border-slate-800', 'border-slate-200'
    $content = $content -replace 'border-slate-700', 'border-slate-200'
    $content = $content -replace 'border-slate-900', 'border-slate-200'
    
    $content = $content -replace 'rgba\(255, 255, 255, 0\.03\)', 'rgba(255, 255, 255, 0.9)'
    $content = $content -replace 'rgba\(255, 255, 255, 0\.1\)', 'rgba(14, 165, 233, 0.15)'
    
    $content = $content -replace 'bg-gradient-blue', 'bg-slate-50'
    $content = $content -replace 'bg-slate-950/95', 'bg-white/95'
    
    Set-Content -Path $f.FullName -Value $content
}
Write-Output "Update finished"
