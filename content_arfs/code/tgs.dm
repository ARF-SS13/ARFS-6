var/global/client_count = 0

/client/New
    . = ..()
    ++global.client_count

/client/Del
    . = ..()
    --global.client_count
